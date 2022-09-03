part of 'app_bloc.dart';

class AppState extends Equatable {
  final ThemeData? themeData;
  final Locale? locale;
  const AppState(this.themeData, this.locale);

  @override
  List<Object> get props => [themeData!, locale!];

  @override
  String toString() => 'AppState { Theme: $themeData , Locale : $locale  }';
}
