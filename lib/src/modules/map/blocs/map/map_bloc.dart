// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:position/src/core/helpers/sharedpreferences.dart';
import 'package:position/src/core/utils/configs.dart';
import 'package:position/src/core/utils/functions.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/modules/map/models/search_model/search_model.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/categories_model.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/category.dart';
import 'package:position/src/modules/map/submodules/categories/repositories/categoriesRepository.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/etablissement.dart';
import 'package:position/src/modules/map/submodules/etablissements/repository/etablissementRepository.dart';
import 'package:position/src/modules/map/submodules/nominatim/repository/nominatimRepository.dart';
import 'package:position/src/modules/map/submodules/tracking/repository/trackingRepository.dart';
import 'package:position/src/modules/map/tools/mapTools.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends HydratedBloc<MapEvent, MapState> {
  MapboxMapController? _mapController;
  CategoriesRepository? categoriesRepository;
  TrackingRepository? trackingRepository;
  NominatimRepository? nominatimRepository;
  EtablissementRepository? etablissementRepository;
  final SharedPreferencesHelper? sharedPreferencesHelper;

  late StreamSubscription<Position> positionStream;

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.bestForNavigation,
    distanceFilter: 5,
  );

  String GEOJSON_SOURCE_ID = "geojson-source-id";
  String ROUTE_LAYER = "route_layer";
  String GEOJSON_ETABLISSEMENT_SOURCE_ID = "geojson-etablissement-source-id";
  String ETABLISSEMENTS_POINTS = "etablissement-points";

  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  MapBloc(
      {this.categoriesRepository,
      this.sharedPreferencesHelper,
      this.trackingRepository,
      this.nominatimRepository,
      this.etablissementRepository})
      : super(MapInitial()) {
    on<OnMapInitializedEvent>(_onInitMap);
    on<GetUserLocationEvent>(_getUserLocation);
    on<GetCategories>(_getCategories);
    on<CategorieClick>(_selectCategorie);
    on<ShowSearchInMap>(_showSearchInMap);
    on<RemoveSymboleInMap>(_removeSymbolInMap);
    on<OnSymboleClick>(_symbolClick);
    on<AddSymboleOnMap>(_addSymbolOnMap);
    on<AddRoutingInMap>(_addRoutingInMap);
    on<AddFavorite>(_addFavorite);
    on<RemoveFavorite>(_removeFavorite);
    on<SharePlace>(_sharePlace);
  }

  _onInitMap(OnMapInitializedEvent event, Emitter<MapState> emit) async {
    _mapController = event.controller;
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) async {
      await trackingRepository?.addtracking(
          position.longitude, position.latitude);
    });
    _mapController?.onFeatureTapped.add((id, point, coordinates) async {
      if (id == "") {
        List<dynamic>? features = await _mapController?.queryRenderedFeatures(
            point, [ETABLISSEMENTS_POINTS], null);
        if (features!.isNotEmpty) {
          add(ShowSearchInMap(
              await onFeatureClick(
                features[0],
                Offset(point.x, point.y),
              ),
              event.user));
        }
      } else {
        add(OnSymboleClick());
      }
    });
    emit(MapInitialized());
  }

  Future<SearchModel> onFeatureClick(dynamic data, Offset point) async {
    data["properties"]["id"] = data["properties"]["id"].toInt();
    data["properties"]["batiment_id"] =
        data["properties"]["batiment_id"].toInt();
    data["properties"]["user_id"] = data["properties"]["user_id"].toInt();
    data["properties"]["etage"] = data["properties"]["etage"].toInt();
    data["properties"]["vues"] = data["properties"]["vues"].toInt();
    data["properties"]["avis"] = data["properties"]["avis"].toInt();
    data["properties"]["batiment"] =
        json.decode(data["properties"]["batiment"].toString());
    data["properties"]["sous_categories"] =
        json.decode(data["properties"]["sous_categories"].toString());
    data["properties"]["commodites"] =
        json.decode(data["properties"]["commodites"].toString());
    data["properties"]["images"] =
        json.decode(data["properties"]["images"].toString());
    data["properties"]["horaires"] =
        json.decode(data["properties"]["horaires"].toString());
    data["properties"]["commentaires"] =
        json.decode(data["properties"]["commentaires"].toString());
    data["properties"]["user"] =
        json.decode(data["properties"]["user"].toString());
    var etabissement = Etablissement.fromJson(data['properties']);

    var searchModel = SearchModel(
        name: etabissement.nom,
        details: etabissement.sousCategories![0].nom,
        type: "etablissement",
        id: etabissement.id.toString(),
        longitude: etabissement.batiment!.longitude,
        latitude: etabissement.batiment!.latitude,
        logo: etabissement.logo ??
            etabissement.sousCategories![0].logourl ??
            etabissement.sousCategories![0].category!.logourl,
        logomap: etabissement.logoMap ??
            etabissement.sousCategories![0].logourlmap ??
            etabissement.sousCategories![0].category!.logourlmap,
        etablissement: etabissement,
        isOpenNow: etabissement.isopen,
        plageDay: checkIfEtablissementIsOpen(etabissement),
        distance: await calculateDistance(etabissement.batiment!.longitude!,
            etabissement.batiment!.latitude!));

    return searchModel;
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

    _mapController!.removeLayer(ROUTE_LAYER);
    _mapController!.removeSource(GEOJSON_SOURCE_ID);

    if (!event.searchModel!.logomap!.contains("http")) {
      var response =
          await http.get(Uri.parse(apiUrl + event.searchModel!.logomap!));
      _mapController?.addImage(event.searchModel!.name!, response.bodyBytes);
    } else {
      var response = await http.get(Uri.parse(event.searchModel!.logomap!));
      _mapController?.addImage(event.searchModel!.name!, response.bodyBytes);
    }

    if (event.searchModel!.type != "categorie") {
      _mapController?.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(double.parse(event.searchModel!.latitude!),
                  double.parse(event.searchModel!.longitude!)),
              zoom: initMapZoom)));
      _mapController?.addSymbol(
        SymbolOptions(
            geometry: LatLng(double.parse(event.searchModel!.latitude!),
                double.parse(event.searchModel!.longitude!)),
            iconImage: event.searchModel!.name!,
            iconSize: event.searchModel!.type! == "nominatim" ? 2.8 : 3),
      );

      emit(SymboledAdded(event.searchModel));
    } else {
      try {
        var etablissementsResults = await etablissementRepository!
            .searchetablissementsbyfilters(
                int.parse(event.searchModel!.id!), event.user!.id!, null);

        if (etablissementsResults.success!.success!) {
          var geojson = createGeoJsonEtablissements(
              etablissementsResults.success!.data!.etablissements);

          await _mapController?.addSource(GEOJSON_ETABLISSEMENT_SOURCE_ID,
              GeojsonSourceProperties(data: geojson));

          await _mapController?.addLayer(
              GEOJSON_ETABLISSEMENT_SOURCE_ID,
              ETABLISSEMENTS_POINTS,
              SymbolLayerProperties(
                  iconImage: event.searchModel!.name!,
                  iconSize: 3,
                  iconAllowOverlap: true,
                  symbolSortKey: 10.0));
          emit(EtablissementsLoaded());
        } else {
          emit(EtablissementsError());
        }
      } catch (e) {
        emit(EtablissementsError());
      }
    }
  }

  _removeSymbolInMap(RemoveSymboleInMap event, Emitter<MapState> emit) {
    _mapController?.clearSymbols();
    _mapController!.removeLayer(ROUTE_LAYER);
    _mapController!.removeSource(GEOJSON_SOURCE_ID);

    _mapController!.removeLayer(ETABLISSEMENTS_POINTS);
    _mapController!.removeSource(GEOJSON_ETABLISSEMENT_SOURCE_ID);
    emit(SymboleRemoved());
  }

  _symbolClick(OnSymboleClick event, Emitter<MapState> emit) {
    emit(SymboleClicked());
  }

  _addSymbolOnMap(AddSymboleOnMap event, Emitter<MapState> emit) async {
    if (_mapController!.symbols.isNotEmpty) {
      _mapController?.clearSymbols();
      _mapController!.removeLayer(ROUTE_LAYER);
      _mapController!.removeSource(GEOJSON_SOURCE_ID);

      _mapController!.removeLayer(ETABLISSEMENTS_POINTS);
      _mapController!.removeSource(GEOJSON_ETABLISSEMENT_SOURCE_ID);
    }
    final ByteData bytes =
        await rootBundle.load("assets/images/png/icon-icon-position-pin.png");
    final Uint8List list = bytes.buffer.asUint8List();
    _mapController?.addImage("markerImage", list);

    _mapController?.addSymbol(SymbolOptions(
        geometry: event.latLng, iconImage: "markerImage", iconSize: 2.8));

    try {
      final nominatimResult = await nominatimRepository?.reverse(
          event.latLng!.longitude.toString(),
          event.latLng!.latitude.toString());
      var searchModel = SearchModel(
          name: nominatimResult!.success!.features![0].properties!.displayName,
          details: nominatimResult
              .success!.features![0].properties!.address!.country,
          id: nominatimResult.success!.features![0].properties!.osmId
              .toString(),
          longitude: nominatimResult
              .success!.features![0].geometry!.coordinates![0]
              .toString(),
          latitude: nominatimResult
              .success!.features![0].geometry!.coordinates![1]
              .toString(),
          logo: "$apiUrl/images/icon-icon-position-pin.png",
          logomap: "$apiUrl/images/icon-icon-position-pin.png",
          type: "nominatim",
          distance: await calculateDistance(
              nominatimResult.success!.features![0].geometry!.coordinates![0]
                  .toString(),
              nominatimResult.success!.features![0].geometry!.coordinates![1]
                  .toString()));

      emit(SymboledAdded(searchModel));
    } catch (e) {
      emit(MapError());
    }
  }

  _addRoutingInMap(AddRoutingInMap event, Emitter<MapState> emit) async {
    _mapController!.removeLayer(ROUTE_LAYER);
    _mapController!.removeSource(GEOJSON_SOURCE_ID);

    _mapController!.removeLayer(ETABLISSEMENTS_POINTS);
    _mapController!.removeSource(GEOJSON_ETABLISSEMENT_SOURCE_ID);
    Position position = await Geolocator.getCurrentPosition();

    String coordonnees =
        "${position.longitude},${position.latitude};${event.lon!},${event.lat!}";

    try {
      var routeResult = await nominatimRepository!.getroute(coordonnees);
      var responses = [];

      if (routeResult.success!.code == "Ok") {
        var properties = {
          "distance": routeResult.success!.routes![0].distance,
          "duration": routeResult.success!.routes![0].duration
        };

        var response = {
          "type": 'Feature',
          "geometry": routeResult.success!.routes![0].geometry!.toJson(),
          "properties": properties,
        };

        responses.add(response);

        var geojson = {
          "type": 'FeatureCollection',
          "features": responses,
        };

        _mapController!.addSource(
            GEOJSON_SOURCE_ID, GeojsonSourceProperties(data: geojson));

        _mapController!.addLayer(
            GEOJSON_SOURCE_ID,
            ROUTE_LAYER,
            const LineLayerProperties(
              lineColor: "#05BF95",
              lineWidth: 7,
              lineOpacity: 0.7,
              lineJoin: "round",
              lineCap: "round",
            ));

        _mapController!.animateCamera(CameraUpdate.zoomTo(14));
      } else {
        emit(RoutingError());
      }
    } catch (e) {
      emit(RoutingError());
    }
  }

  _addFavorite(AddFavorite event, Emitter<MapState> emit) async {
    try {
      var favoriteResult =
          await etablissementRepository!.addfavorite(event.idEtablissement!);

      if (favoriteResult.success!.success!) {
        emit(FavoriteAdded());
      }
    } catch (e) {
      emit(FavoriteError());
    }
  }

  _removeFavorite(RemoveFavorite event, Emitter<MapState> emit) async {
    try {
      var favoriteResult =
          await etablissementRepository!.removefavorite(event.idEtablissement!);

      if (favoriteResult.success!.success!) {
        emit(FavoriteRemoved());
      }
    } catch (e) {
      emit(FavoriteError());
    }
  }

  _sharePlace(SharePlace event, Emitter<MapState> emit) async {
    String searchmodel = json.encode(event.searchModel!.toJson());

    try {
      final DynamicLinkParameters parameters = DynamicLinkParameters(
        uriPrefix: 'https://app.position.cm/',
        link: Uri.parse('https://app.position.cm?searchmodel=$searchmodel'),
        androidParameters: const AndroidParameters(
          packageName: 'cm.geosmfamily.position',
          minimumVersion: 0,
        ),
        iosParameters: const IOSParameters(
          bundleId: 'cm.geosmfamily.position',
          minimumVersion: '0',
        ),
        socialMetaTagParameters: SocialMetaTagParameters(
          title: event.searchModel!.name,
          description: event.searchModel!.details,
          imageUrl: event.searchModel!.type == "etablissement"
              ? Uri.parse(apiUrl + event.searchModel!.etablissement!.cover)
              : null,
        ),
      );

      final ShortDynamicLink shortLink = await dynamicLinks.buildShortLink(
          parameters,
          shortLinkType: ShortDynamicLinkType.unguessable);

      emit(PlaceShared(shortLink.shortUrl.toString()));
    } catch (e) {
      emit(SharedError());
    }
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
