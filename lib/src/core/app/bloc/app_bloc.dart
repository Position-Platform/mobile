import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:position/src/core/app/themes.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
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
}
