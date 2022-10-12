part of 'map_bloc.dart';

abstract class MapState extends Equatable {
  const MapState();

  @override
  List<Object> get props => [];
}

class MapInitial extends MapState {}

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
