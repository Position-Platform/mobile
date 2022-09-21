// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:position/src/core/helpers/sharedpreferences.dart';
import 'package:position/src/core/utils/configs.dart';
import 'package:position/src/modules/map/models/search_model/search_model.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/categories_model.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/category.dart';
import 'package:position/src/modules/map/submodules/categories/repositories/categoriesRepository.dart';
import 'package:position/src/modules/map/submodules/tracking/repository/trackingRepository.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends HydratedBloc<MapEvent, MapState> {
  MapboxMapController? _mapController;
  CategoriesRepository? categoriesRepository;
  TrackingRepository? trackingRepository;
  final SharedPreferencesHelper? sharedPreferencesHelper;

  late StreamSubscription<Position> positionStream;

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.bestForNavigation,
    distanceFilter: 5,
  );

  MapBloc(
      {this.categoriesRepository,
      this.sharedPreferencesHelper,
      this.trackingRepository})
      : super(MapInitial()) {
    on<OnMapInitializedEvent>(_onInitMap);
    on<GetUserLocationEvent>(_getUserLocation);
    on<GetCategories>(_getCategories);
    on<CategorieClick>(_selectCategorie);
    on<ShowSearchInMap>(_showSearchInMap);
  }

  _onInitMap(OnMapInitializedEvent event, Emitter<MapState> emit) async {
    _mapController = event.controller;
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) async {
      await trackingRepository?.addtracking(
          position.longitude, position.latitude);
    });
  }

  _getUserLocation(GetUserLocationEvent event, Emitter<MapState> emit) async {
    Position position = await Geolocator.getCurrentPosition();
    _mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: initMapZoom)));
    await trackingRepository?.addtracking(
        position.longitude, position.latitude);
  }

  _getCategories(GetCategories event, Emitter<MapState> emit) async {
    emit(CategoriesLoading());
    try {
      var categoriesResult = await categoriesRepository?.getallcategories();

      if (categoriesResult!.success!.success!) {
        emit(CategoriesLoaded(categoriesResult.success));
      }
    } catch (e) {
      emit(CategoriesError());
    }
  }

  _selectCategorie(CategorieClick event, Emitter<MapState> emit) async {
    try {
      var categorieResult = await categoriesRepository?.updatecategoriebyid(
          event.categorie!.id!, event.categorie!);

      if (categorieResult!.success!.success!) {}
    } catch (e) {
      emit(CategoriesError());
    }
  }

  _showSearchInMap(ShowSearchInMap event, Emitter<MapState> emit) async {
    if (_mapController!.symbols.isNotEmpty) {
      _mapController?.clearSymbols();
    }

    if (!event.searchModel!.logomap!.contains("http")) {
      var response =
          await http.get(Uri.parse(apiUrl + event.searchModel!.logomap!));
      _mapController?.addImage(event.searchModel!.name!, response.bodyBytes);
    } else {
      var response = await http.get(Uri.parse(event.searchModel!.logomap!));
      _mapController?.addImage(event.searchModel!.name!, response.bodyBytes);
    }
    _mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(double.parse(event.searchModel!.latitude!),
            double.parse(event.searchModel!.longitude!)),
        zoom: initMapZoom)));
    _mapController?.addSymbol(
      SymbolOptions(
          geometry: LatLng(double.parse(event.searchModel!.latitude!),
              double.parse(event.searchModel!.longitude!)),
          iconImage: event.searchModel!.name!,
          iconSize: event.searchModel!.type! == "nominatim" ? 2.5 : 4),
    );
  }

  @override
  MapState? fromJson(Map<String, dynamic> json) {
    try {
      final categories = CategoriesModel.fromJson(json);
      return CategoriesLoaded(categories);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(MapState state) {
    if (state is CategoriesLoaded) {
      return state.categories!.toJson();
    }

    return null;
  }

  @override
  Future<void> close() {
    positionStream.cancel();
    return super.close();
  }
}
