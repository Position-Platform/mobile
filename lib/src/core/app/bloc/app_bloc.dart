import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:position/src/core/app/themes.dart';

part 'app_event.dart';
part 'app_state.dart';

// La classe AppBloc étend la classe HydratedBloc pour permettre la persistance de l'état de l'application
class AppBloc extends HydratedBloc<AppEvent, AppState> {
  // Le constructeur de la classe initialise l'état initial de l'application avec un thème clair et la langue française
  AppBloc()
      : super(AppState(AppThemes.appThemeData[AppTheme.lightTheme],
            const Locale('fr', 'FR'))) {
    // Les méthodes _changeTheme et _changeLanguage sont appelées lorsqu'un événement ChangeTheme ou ChangeLanguage est émis
    on<ChangeTheme>(_changeTheme);
    on<ChangeLanguage>(_changeLanguage);
  }

  // La méthode _changeTheme met à jour l'état de l'application avec un nouveau thème
  void _changeTheme(ChangeTheme event, Emitter<AppState> emit) =>
      emit(AppState(AppThemes.appThemeData[event.appTheme], state.locale));

  // La méthode _changeLanguage met à jour l'état de l'application avec une nouvelle langue
  void _changeLanguage(ChangeLanguage event, Emitter<AppState> emit) =>
      emit(AppState(state.themeData, event.locale));

  // La méthode fromJson prend un objet JSON et renvoie une instance de la classe AppState
  @override
  AppState? fromJson(Map<String, dynamic> json) {
    try {
      final ThemeData? theme;
      final Locale locale;

      // Si l'objet JSON contient la clé 'light' avec la valeur true, le thème est défini sur clair, sinon il est défini sur foncé
      theme = json['light'] as bool
          ? AppThemes.appThemeData[AppTheme.lightTheme]
          : AppThemes.appThemeData[AppTheme.darkTheme];

      // Si l'objet JSON contient la clé 'locale' avec la valeur true, la langue est définie sur français, sinon elle est définie sur anglais
      locale = json['locale'] as bool
          ? const Locale('fr', 'FR')
          : const Locale('en', 'US');

      return AppState(theme, locale);
    } catch (e) {
      return null;
    }
  }

  // La méthode toJson prend une instance de la classe AppState et renvoie un objet JSON
  @override
  Map<String, bool>? toJson(AppState state) => {
        // Si le thème de l'application est clair, la clé 'light' a la valeur true, sinon elle a la valeur false
        'light': state.themeData == AppThemes.appThemeData[AppTheme.lightTheme],
        // Si la langue de l'application est française, la clé 'locale' a la valeur true, sinon elle a la valeur false
        'locale': state.locale == const Locale('fr', 'FR')
      };
}
