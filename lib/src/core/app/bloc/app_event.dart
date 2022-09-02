part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class ChangeTheme extends AppEvent {
  final AppTheme appTheme;
  const ChangeTheme(this.appTheme);

  @override
  List<Object> get props => [appTheme];

  @override
  String toString() => 'AppEvent { Theme: $appTheme   }';
}

class ChangeLanguage extends AppEvent {
  final Locale locale;
  const ChangeLanguage(this.locale);

  @override
  List<Object> get props => [locale];

  @override
  String toString() => 'AppEvent {  Locale: $locale  }';
}
