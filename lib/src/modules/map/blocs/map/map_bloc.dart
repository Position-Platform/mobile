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
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/commentaire.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/datum.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/etablissements.dart';
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
    on<SelectChips>(_selectChip);
    on<DistanceSelect>(_distanceSelect);
    on<AvisSelect>(_avisSelect);
    on<PertinenceSelect>(_pertinenceSelect);
    on<SearchEtablissementByFilter>(_searchEtablissementByFilters);
    on<CloseExpanded>(_closeExpanded);
    on<UpdateViewEtablissement>(_updateViewEtablissement);
    on<LoadMoreEtablissement>(_loadMoreEtablissement);
    on<AddReview>(_addReview);
    on<GetFavorite>(_getFavorite);
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
    data["properties"]["count"] =
        json.decode(data["properties"]["count"].toString());

    var etabissement = Datum.fromJson(data['properties']);

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
      emit(CategoriesClicked(event.isClick, event.category));
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
                int.parse(event.searchModel!.id!), event.user!.id!, 1);

        if (etablissementsResults.success!.success!) {
          var geojson = createGeoJsonEtablissements(
              etablissementsResults.success!.data!.etablissements!.data);

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
          emit(EtablissementsLoaded(
              etablissementsResults.success!.data!.etablissements!));
        } else {
          emit(EtablissementsError());
        }
      } catch (e) {
        emit(EtablissementsError());
      }
    }
  }

  _searchEtablissementByFilters(
      SearchEtablissementByFilter event, Emitter<MapState> emit) async {
    if (_mapController!.symbols.isNotEmpty) {
      _mapController?.clearSymbols();
    }

    _mapController!.removeLayer(ROUTE_LAYER);
    _mapController!.removeLayer(ETABLISSEMENTS_POINTS);
    _mapController!.removeSource(GEOJSON_SOURCE_ID);
    _mapController!.removeSource(GEOJSON_ETABLISSEMENT_SOURCE_ID);

    if (!event.categorie!.logourlmap!.contains("http")) {
      var response =
          await http.get(Uri.parse(apiUrl + event.categorie!.logourlmap!));
      _mapController?.addImage(event.categorie!.shortname!, response.bodyBytes);
    } else {
      var response = await http.get(Uri.parse(event.categorie!.logourlmap!));
      _mapController?.addImage(event.categorie!.shortname!, response.bodyBytes);
    }
    try {
      emit(EtablissementsLoading());
      var etablissementsResults = await etablissementRepository!
          .searchetablissementsbyfilters(
              event.categorie!.id!, event.user!.id!, 1);

      if (etablissementsResults.success!.success!) {
        var geojson = createGeoJsonEtablissements(
            etablissementsResults.success!.data!.etablissements!.data);

        for (var i = 0;
            i <
                etablissementsResults
                    .success!.data!.etablissements!.data!.length;
            i++) {
          etablissementsResults
                  .success!.data!.etablissements!.data![i].distance =
              await calculateDistance(
                  etablissementsResults.success!.data!.etablissements!.data![i]
                      .batiment!.longitude
                      .toString(),
                  etablissementsResults.success!.data!.etablissements!.data![i]
                      .batiment!.latitude
                      .toString());
        }

        await _mapController?.addSource(GEOJSON_ETABLISSEMENT_SOURCE_ID,
            GeojsonSourceProperties(data: geojson));

        await _mapController?.addLayer(
            GEOJSON_ETABLISSEMENT_SOURCE_ID,
            ETABLISSEMENTS_POINTS,
            SymbolLayerProperties(
                iconImage: event.categorie!.shortname!,
                iconSize: 3,
                iconAllowOverlap: true,
                symbolSortKey: 10.0));

        if (event.distance!) {
          etablissementsResults.success!.data!.etablissements!.data!
              .sort((a, b) => a.distance!.compareTo(b.distance!));
          emit(EtablissementsLoaded(
              etablissementsResults.success!.data!.etablissements!));
        } else if (event.avis!) {
          etablissementsResults.success!.data!.etablissements!.data!
              .sort((a, b) => b.avis!.compareTo(a.avis!));
          emit(EtablissementsLoaded(
              etablissementsResults.success!.data!.etablissements!));
        } else if (event.pertinance!) {
          etablissementsResults.success!.data!.etablissements!.data!
              .sort((a, b) => b.vues!.compareTo(a.vues!));
          emit(EtablissementsLoaded(
              etablissementsResults.success!.data!.etablissements!));
        }
      } else {
        emit(EtablissementsError());
      }
    } catch (e) {
      emit(EtablissementsError());
    }
  }

  _updateViewEtablissement(
      UpdateViewEtablissement event, Emitter<MapState> emit) async {
    try {
      await etablissementRepository!
          .updateetablissementview(event.idEtablissement!);
    } catch (e) {
      //
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

  _closeExpanded(CloseExpanded event, Emitter<MapState> emit) {
    emit(ExpandedClose());
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
          await etablissementRepository!.addfavorite(event.etablissement!.id!);

      if (favoriteResult.success!.success!) {
        event.etablissement!.distance = await calculateDistance(
            event.etablissement!.batiment!.longitude!,
            event.etablissement!.batiment!.latitude!);
        emit(FavoriteAdded(event.etablissement));
      }
    } catch (e) {
      emit(FavoriteError());
    }
  }

  _removeFavorite(RemoveFavorite event, Emitter<MapState> emit) async {
    try {
      var favoriteResult = await etablissementRepository!
          .removefavorite(event.etablissement!.id!);

      if (favoriteResult.success!.success!) {
        emit(FavoriteRemoved(event.etablissement));
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
              ? Uri.parse(apiUrl + event.searchModel!.etablissement!.cover!)
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

  _selectChip(SelectChips event, Emitter<MapState> emit) {}

  _distanceSelect(DistanceSelect event, Emitter<MapState> emit) {
    emit(DistanceSelected());
  }

  _avisSelect(AvisSelect event, Emitter<MapState> emit) {
    emit(AvisSelected());
  }

  _pertinenceSelect(PertinenceSelect event, Emitter<MapState> emit) {
    emit(PertinenceSelected());
  }

  _loadMoreEtablissement(
      LoadMoreEtablissement event, Emitter<MapState> emit) async {
    _mapController!.removeLayer(ETABLISSEMENTS_POINTS);
    _mapController!.removeSource(GEOJSON_ETABLISSEMENT_SOURCE_ID);
    if (event.hasNextPage! == true && event.isLoadMoreRunning! == false) {
      emit(LoadMoreRunning());
      try {
        var etablissementsResults = await etablissementRepository!
            .searchetablissementsbyfilters(
                event.categorie!.id!, event.user!.id!, event.page);

        if (etablissementsResults.success!.success!) {
          if (etablissementsResults
              .success!.data!.etablissements!.data!.isNotEmpty) {
            event.etablisement!.data!.addAll(
                etablissementsResults.success!.data!.etablissements!.data!);
            var geojson =
                createGeoJsonEtablissements(event.etablisement!.data!);

            for (var i = 0;
                i <
                    etablissementsResults
                        .success!.data!.etablissements!.data!.length;
                i++) {
              etablissementsResults
                      .success!.data!.etablissements!.data![i].distance =
                  await calculateDistance(
                      etablissementsResults.success!.data!.etablissements!
                          .data![i].batiment!.longitude
                          .toString(),
                      etablissementsResults.success!.data!.etablissements!
                          .data![i].batiment!.latitude
                          .toString());
            }

            await _mapController?.addSource(GEOJSON_ETABLISSEMENT_SOURCE_ID,
                GeojsonSourceProperties(data: geojson));

            await _mapController?.addLayer(
                GEOJSON_ETABLISSEMENT_SOURCE_ID,
                ETABLISSEMENTS_POINTS,
                SymbolLayerProperties(
                    iconImage: event.categorie!.shortname!,
                    iconSize: 3,
                    iconAllowOverlap: true,
                    symbolSortKey: 10.0));

            if (event.distance!) {
              etablissementsResults.success!.data!.etablissements!.data!
                  .sort((a, b) => a.distance!.compareTo(b.distance!));
              emit(EtablissementsMoreLoaded(
                  etablissementsResults.success!.data!.etablissements!,
                  event.page,
                  event.distance,
                  event.avis,
                  event.pertinance));
            } else if (event.avis!) {
              etablissementsResults.success!.data!.etablissements!.data!
                  .sort((a, b) => b.avis!.compareTo(a.avis!));
              emit(EtablissementsMoreLoaded(
                  etablissementsResults.success!.data!.etablissements!,
                  event.page,
                  event.distance,
                  event.avis,
                  event.pertinance));
            } else if (event.pertinance!) {
              etablissementsResults.success!.data!.etablissements!.data!
                  .sort((a, b) => b.vues!.compareTo(a.vues!));
              emit(EtablissementsMoreLoaded(
                  etablissementsResults.success!.data!.etablissements!,
                  event.page,
                  event.distance,
                  event.avis,
                  event.pertinance));
            }
          } else {
            emit(HasNextPage());
          }
        } else {
          emit(EtablissementsError());
        }
      } catch (e) {
        emit(EtablissementsError());
      }
    }
  }

  _addReview(AddReview event, Emitter<MapState> emit) async {
    emit(ReviewLoading());
    try {
      var review = await etablissementRepository!
          .addreview(event.idEtablissement!, event.commentaire!, event.rating!);
      if (review.success!.success!) {
        emit(ReviewAdded(review.success!.data!.commentaire));
      } else {
        emit(ReviewError());
      }
    } catch (e) {
      emit(ReviewError());
    }
  }

  _getFavorite(GetFavorite event, Emitter<MapState> emit) async {
    emit(FavoriteLoading());
    try {
      var favorite = await etablissementRepository!.getallfavoris();
      if (favorite.success!.success!) {
        for (var i = 0; i < favorite.success!.data!.length; i++) {
          favorite.success!.data![i].distance = await calculateDistance(
              favorite.success!.data![i].batiment!.longitude.toString(),
              favorite.success!.data![i].batiment!.latitude.toString());
        }
        emit(FavoriteLoaded(favorite.success!.data));
      } else {
        emit(FavoriteError());
      }
    } catch (e) {
      emit(FavoriteError());
    }
  }

  @override
  MapState? fromJson(Map<String, dynamic> json) {
    try {
      final categories = CategoriesModel.fromJson(json['categories']);
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
