part of 'app_bloc.dart';

// La classe AppState étend la classe Equatable pour permettre la comparaison d'instances de la classe
class AppState extends Equatable {
  // Les propriétés themeData et locale représentent l'état de l'application
  final ThemeData? themeData;
  final Locale? locale;

  // Le constructeur de la classe prend deux arguments : themeData et locale
  const AppState(this.themeData, this.locale);

  // La méthode props retourne une liste d'objets qui représentent les propriétés de la classe
  @override
  List<Object> get props => [themeData!, locale!];

  // La méthode toString retourne une chaîne de caractères qui représente l'état actuel de l'application
  @override
  String toString() => 'AppState { Theme: $themeData , Locale : $locale  }';
}
