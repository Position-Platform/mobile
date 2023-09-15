part of 'app_bloc.dart';

// La classe abstraite AppEvent étend la classe Equatable pour permettre la comparaison d'instances de la classe
abstract class AppEvent extends Equatable {
  const AppEvent();

  // La méthode props retourne une liste d'objets qui représentent les propriétés de la classe
  @override
  List<Object> get props => [];
}

// La classe ChangeTheme représente un événement qui modifie le thème de l'application
class ChangeTheme extends AppEvent {
  final AppTheme appTheme;
  const ChangeTheme(this.appTheme);

  // La méthode props retourne une liste d'objets qui représentent les propriétés de la classe
  @override
  List<Object> get props => [appTheme];

  // La méthode toString retourne une chaîne de caractères qui représente l'événement actuel
  @override
  String toString() => 'AppEvent { Theme: $appTheme   }';
}

// La classe ChangeLanguage représente un événement qui modifie la langue de l'application
class ChangeLanguage extends AppEvent {
  final Locale locale;
  const ChangeLanguage(this.locale);

  // La méthode props retourne une liste d'objets qui représentent les propriétés de la classe
  @override
  List<Object> get props => [locale];

  // La méthode toString retourne une chaîne de caractères qui représente l'événement actuel
  @override
  String toString() => 'AppEvent {  Locale: $locale  }';
}
