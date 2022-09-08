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
  String toString() => 'Categorie { Categorie: $categorie }';
}
