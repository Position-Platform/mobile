part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnMapInitializedEvent extends MapEvent {
  final MapboxMapController controller;

  const OnMapInitializedEvent(this.controller);
}

class GetUserLocationEvent extends MapEvent {}

class GetCategories extends MapEvent {}

class CategorieClick extends MapEvent {
  final Category? categorie;

  const CategorieClick(this.categorie);

  @override
  List<Object> get props => [categorie!];

  @override
  String toString() => 'CategorieClick { Categorie: $categorie }';
}

class ShowSearchInMap extends MapEvent {
  final SearchModel? searchModel;

  const ShowSearchInMap(this.searchModel);

  @override
  List<Object> get props => [searchModel!];

  @override
  String toString() => 'ShowSearchInMap { SearchModel: $searchModel }';
}

class OnSymboleClick extends MapEvent {}

class RemoveSymboleInMap extends MapEvent {}

class AddSymboleOnMap extends MapEvent {
  final LatLng? latLng;

  const AddSymboleOnMap(this.latLng);

  @override
  List<Object> get props => [latLng!];

  @override
  String toString() => 'AddSymboleOnMap { LatLng: $latLng }';
}

class AddRoutingInMap extends MapEvent {
  final String? lon;
  final String? lat;

  const AddRoutingInMap(this.lon, this.lat);

  @override
  List<Object> get props => [lon!, lat!];

  @override
  String toString() => 'AddRoutingInMap { Lat: $lat , Lon: $lon }';
}

class AddFavorite extends MapEvent {
  final int? idEtablissement;

  const AddFavorite(this.idEtablissement);

  @override
  List<Object> get props => [idEtablissement!];

  @override
  String toString() => 'AddFavorite { idEtablissement: $idEtablissement }';
}

class RemoveFavorite extends MapEvent {
  final int? idEtablissement;

  const RemoveFavorite(this.idEtablissement);

  @override
  List<Object> get props => [idEtablissement!];

  @override
  String toString() => 'RemoveFavorite { idEtablissement: $idEtablissement }';
}

class SharePlace extends MapEvent {
  final SearchModel? searchModel;

  const SharePlace(this.searchModel);

  @override
  List<Object> get props => [searchModel!];

  @override
  String toString() => 'SharePlace { SearchModel: $searchModel }';
}
