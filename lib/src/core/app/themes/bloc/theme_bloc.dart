import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:position/src/core/app/themes/themes.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(
          AppThemes.appThemeData[AppTheme.lightTheme],
        )) {
    on<ThemeEvent>((event, emit) {
      emit(ThemeState(AppThemes.appThemeData[event.appTheme]));
    });
  }
}
