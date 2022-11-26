part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnMapInitializedEvent extends MapEvent {
  final MapboxMapController controller;
  final User? user;

  const OnMapInitializedEvent(this.controller, this.user);
}

class GetUserLocationEvent extends MapEvent {}

class GetCategories extends MapEvent {}

class CategorieClick extends MapEvent {
  final bool? isClick;
  final Category? category;

  const CategorieClick(this.isClick, this.category);

  @override
  List<Object> get props => [isClick!, category!];

  @override
  String toString() =>
      'CategorieClick { isClick:$isClick, Category: $category }';
}

class ShowSearchInMap extends MapEvent {
  final SearchModel? searchModel;
  final User? user;

  const ShowSearchInMap(this.searchModel, this.user);

  @override
  List<Object> get props => [searchModel!, user!];

  @override
  String toString() =>
      'ShowSearchInMap { SearchModel: $searchModel, User: $user }';
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

class GetTypeCommodites extends MapEvent {}

class SelectChips extends MapEvent {
  final Commodite? commodite;

  const SelectChips(this.commodite);

  @override
  List<Object> get props => [commodite!];

  @override
  String toString() => 'SelectChips { Commodite: $commodite }';
}

class DistanceSelect extends MapEvent {}

class AvisSelect extends MapEvent {}

class PertinenceSelect extends MapEvent {}

class SearchEtablissementByFilter extends MapEvent {
  final Category? categorie;
  final User? user;
  final String idsCommodite;

  const SearchEtablissementByFilter(
      this.categorie, this.user, this.idsCommodite);

  @override
  List<Object> get props => [categorie!, idsCommodite, user!];

  @override
  String toString() =>
      'SearchEtablissementByFilter { categorie: $categorie , user : $user , idsCommodite : $idsCommodite }';
}

class CloseExpanded extends MapEvent {}
