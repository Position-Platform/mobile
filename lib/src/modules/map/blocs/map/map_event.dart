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
  final Category? category;

  const CategorieClick(this.category);

  @override
  List<Object> get props => [category!];

  @override
  String toString() => 'CategorieClick { Category: $category }';
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
  final Datum? etablissement;

  const AddFavorite(this.etablissement);

  @override
  List<Object> get props => [etablissement!];

  @override
  String toString() => 'AddFavorite { Etablissement: $etablissement }';
}

class RemoveFavorite extends MapEvent {
  final Datum? etablissement;

  const RemoveFavorite(this.etablissement);

  @override
  List<Object> get props => [etablissement!];

  @override
  String toString() => 'RemoveFavorite { Etablissement: $etablissement }';
}

class UpdateViewEtablissement extends MapEvent {
  final int? idEtablissement;

  const UpdateViewEtablissement(this.idEtablissement);

  @override
  List<Object> get props => [idEtablissement!];

  @override
  String toString() =>
      'UpdateViewEtablissement { idEtablissement: $idEtablissement }';
}

class SharePlace extends MapEvent {
  final SearchModel? searchModel;

  const SharePlace(this.searchModel);

  @override
  List<Object> get props => [searchModel!];

  @override
  String toString() => 'SharePlace { SearchModel: $searchModel }';
}

class SelectChips extends MapEvent {}

class DistanceSelect extends MapEvent {}

class AvisSelect extends MapEvent {}

class PertinenceSelect extends MapEvent {}

class SearchEtablissementByFilter extends MapEvent {
  final Category? categorie;
  final User? user;
  final String? commodites;
  final bool? distance;
  final bool? avis;
  final bool? pertinance;

  const SearchEtablissementByFilter(this.categorie, this.user, this.commodites,
      this.distance, this.avis, this.pertinance);

  @override
  List<Object> get props =>
      [categorie!, commodites!, user!, distance!, avis!, pertinance!];

  @override
  String toString() =>
      'SearchEtablissementByFilter { categorie: $categorie , user : $user , commodites : $commodites , distance:$distance , avis:$avis , pertinance: $pertinance }';
}

class CloseExpanded extends MapEvent {}

class LoadMoreEtablissement extends MapEvent {
  final bool? hasNextPage;
  final bool? isLoadMoreRunning;
  final int? page;

  final Category? categorie;
  final User? user;
  final bool? distance;
  final bool? avis;
  final bool? pertinance;
  final String? commodites;

  final Etablissements? etablisement;

  const LoadMoreEtablissement(
      this.hasNextPage,
      this.isLoadMoreRunning,
      this.page,
      this.categorie,
      this.user,
      this.distance,
      this.avis,
      this.pertinance,
      this.commodites,
      this.etablisement);

  @override
  List<Object> get props => [
        hasNextPage!,
        isLoadMoreRunning!,
        page!,
        categorie!,
        user!,
        distance!,
        avis!,
        pertinance!,
        commodites!,
        etablisement!
      ];

  @override
  String toString() =>
      'LoadMoreEtablissement {  hasNextPage : $hasNextPage , isLoadMoreRunning : $isLoadMoreRunning , page  categorie: $categorie , user : $user ,  distance:$distance , avis:$avis , pertinance: $pertinance, commodites:$commodites, etablisement: $etablisement }';
}

class AddReview extends MapEvent {
  final int? idEtablissement;
  final String? commentaire;
  final int? rating;

  const AddReview(this.idEtablissement, this.commentaire, this.rating);

  @override
  List<Object> get props => [idEtablissement!, commentaire!, rating!];

  @override
  String toString() =>
      'AddReview { idEtablissement: $idEtablissement , review: $commentaire , note: $rating }';
}

class GetFavorite extends MapEvent {}
