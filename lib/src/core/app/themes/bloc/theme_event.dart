part of 'theme_bloc.dart';

class ThemeEvent extends Equatable {
  final AppTheme appTheme;
  const ThemeEvent(this.appTheme);

  @override
  List<Object> get props => [appTheme];

  @override
  String toString() => 'ThemeEvent { Theme: $appTheme  }';
}
