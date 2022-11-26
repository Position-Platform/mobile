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
  final List<Commodite>? commodites;
  final bool? isClicked;
  final Category? category;

  const CategoriesClicked(this.commodites, this.isClicked, this.category);

  @override
  List<Object> get props => [commodites!, isClicked!, category!];

  @override
  String toString() =>
      'CategoriesClicked { Commodites: $commodites , isClicked: $isClicked , Category: $category}';
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

class FavoriteAdded extends MapState {}

class FavoriteRemoved extends MapState {}

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
  final List<Etablissement>? etablissements;

  const EtablissementsLoaded(this.etablissements);

  @override
  List<Object> get props => [etablissements!];

  @override
  String toString() =>
      'EtablissementsLoaded { Etablissements: $etablissements }';
}

class EtablissementsLoading extends MapState {}

class EtablissementsError extends MapState {}

class CommoditeSelected extends MapState {
  final List<Commodite>? commodites;

  const CommoditeSelected(this.commodites);

  @override
  List<Object> get props => [commodites!];

  @override
  String toString() => 'CommoditeSelected { Commodites: $commodites }';
}

class TypeCommoditesLoaded extends MapState {
  final List<TypesCommodite>? typesCommodites;

  const TypeCommoditesLoaded(this.typesCommodites);

  @override
  List<Object> get props => [typesCommodites!];

  @override
  String toString() =>
      'TypeCommoditesLoaded { TypesCommodites: $typesCommodites }';
}

class SelectedChips extends MapState {
  final Commodite? commodite;
  final List<Commodite>? commoditesSelected;

  const SelectedChips(this.commodite, this.commoditesSelected);

  @override
  List<Object> get props => [commodite!, commoditesSelected!];

  @override
  String toString() =>
      'SelectedChips { Commodite: $commodite,CommoditesSelected: $commoditesSelected }';
}

class UnSelectedChips extends MapState {
  final Commodite? commodite;

  const UnSelectedChips(this.commodite);

  @override
  List<Object> get props => [commodite!];

  @override
  String toString() => 'UnSelectedChips { Commodite: $commodite }';
}

class DistanceSelected extends MapState {}

class AvisSelected extends MapState {}

class PertinenceSelected extends MapState {}

class ExpandedClose extends MapState {}
