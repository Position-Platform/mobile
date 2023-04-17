part of 'map_bloc.dart';

abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

class MapInitial extends MapState {}

class MapInitialized extends MapState {}

class MapError extends MapState {}

class CategoriesLoading extends MapState {}

class CategoriesError extends MapState {}

class CategoriesLoaded extends MapState {
  final CategoriesModel? categories;

  const CategoriesLoaded(this.categories);

  @override
  List<Object> get props => [categories!];

  @override
  String toString() => 'CategoriesLoaded { Categories: $categories }';
}

class CategoriesClicked extends MapState {
  final Category? category;

  const CategoriesClicked(this.category);

  @override
  List<Object> get props => [category!];

  @override
  String toString() => 'CategoriesClicked {  Category: $category}';
}

class SymboledAdded extends MapState {
  final SearchModel? searchresult;

  const SymboledAdded(this.searchresult);

  @override
  List<Object> get props => [searchresult!];

  @override
  String toString() => 'SymboledAdded { Search Result: $searchresult }';
}

class SymboleClicked extends MapState {}

class SymboleRemoved extends MapState {}

class RoutingAdded extends MapState {}

class RoutingError extends MapState {}

class FavoriteAddProcess extends MapState {}

class FavoriteRemoveProcess extends MapState {}

class FavoriteAdded extends MapState {
  final Datum? favoris;

  const FavoriteAdded(this.favoris);

  @override
  List<Object> get props => [favoris!];

  @override
  String toString() => 'FavoriteAdded { Favoris: $favoris }';
}

class FavoriteRemoved extends MapState {
  final Datum? favoris;

  const FavoriteRemoved(this.favoris);

  @override
  List<Object> get props => [favoris!];

  @override
  String toString() => 'FavoriteRemoved { Favoris: $favoris }';
}

class FavoriteError extends MapState {}

class PlaceShared extends MapState {
  final String? url;

  const PlaceShared(this.url);

  @override
  List<Object> get props => [url!];

  @override
  String toString() => 'PlaceShared { ShareUrl: $url }';
}

class SharedError extends MapState {}

class EtablissementsLoaded extends MapState {
  final Etablissements? etablissements;

  const EtablissementsLoaded(this.etablissements);

  @override
  List<Object> get props => [etablissements!];

  @override
  String toString() =>
      'EtablissementsLoaded { Etablissements: $etablissements }';
}

class EtablissementsLoading extends MapState {}

class EtablissementsError extends MapState {}

class CommoditeSelected extends MapState {}

class SelectedChips extends MapState {}

class UnSelectedChips extends MapState {}

class DistanceSelected extends MapState {}

class AvisSelected extends MapState {}

class PertinenceSelected extends MapState {}

class ExpandedClose extends MapState {}

class LoadMoreRunning extends MapState {}

class HasNextPage extends MapState {}

class EtablissementsMoreLoaded extends MapState {
  final Etablissements? etablissements;
  final int? page;

  final bool? distance;
  final bool? avis;
  final bool? pertinance;
  final String? commodites;

  const EtablissementsMoreLoaded(this.etablissements, this.page, this.distance,
      this.avis, this.pertinance, this.commodites);

  @override
  List<Object> get props =>
      [etablissements!, page!, distance!, avis!, pertinance!, commodites!];

  @override
  String toString() =>
      'EtablissementsLoaded { Etablissements: $etablissements , Page: $page , Distance: $distance , Avis: $avis , Pertinance: $pertinance, commodites: $commodites }';
}

class ReviewAdded extends MapState {
  final Commentaire? commentaire;

  const ReviewAdded(this.commentaire);

  @override
  List<Object> get props => [commentaire!];

  @override
  String toString() => 'ReviewAdded { Commentaire: $commentaire }';
}

class ReviewError extends MapState {}

class ReviewLoading extends MapState {}

class FavoriteLoading extends MapState {}

class FavoriteLoaded extends MapState {
  final List<Datum>? favoris;

  const FavoriteLoaded(this.favoris);

  @override
  List<Object> get props => [favoris!];

  @override
  String toString() => 'FavoriteLoaded { Favoris: $favoris }';
}

class MapDownDownloading extends MapState {}

class MapDownloadedError extends MapState {}

class UpdateDownloadProgress extends MapState {
  final double? progress;

  const UpdateDownloadProgress(this.progress);

  @override
  List<Object> get props => [progress!];

  @override
  String toString() => 'UpdateDownloadProgress { Progress: $progress }';
}

class DownloadComplete extends MapState {}

class DownloadMapRemoved extends MapState {}
