import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:position/src/core/app/themes.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends HydratedBloc<AppEvent, AppState> {
  AppBloc()
      : super(AppState(AppThemes.appThemeData[AppTheme.lightTheme],
            const Locale('fr', 'FR'))) {
    on<ChangeTheme>(_changeTheme);
    on<ChangeLanguage>(_changeLanguage);
  }

  void _changeTheme(
    ChangeTheme event,
    Emitter<AppState> emit,
  ) {
    emit(AppState(AppThemes.appThemeData[event.appTheme], state.locale));
  }

  void _changeLanguage(
    ChangeLanguage event,
    Emitter<AppState> emit,
  ) {
    emit(AppState(state.themeData, event.locale));
  }

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    try {
      final ThemeData? theme;
      final Locale locale;

      if (json['light'] as bool) {
        theme = AppThemes.appThemeData[AppTheme.lightTheme];
      } else {
        theme = AppThemes.appThemeData[AppTheme.darkTheme];
      }

      if (json['locale'] as bool) {
        locale = const Locale('fr', 'FR');
      } else {
        locale = const Locale('en', 'US');
      }

      return AppState(theme, locale);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, bool>? toJson(AppState state) {
    return {
      'light': state.themeData == AppThemes.appThemeData[AppTheme.lightTheme],
      'locale': state.locale == const Locale('fr', 'FR')
    };
  }
}
