// ignore_for_file: file_names, avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';

// Cette classe est utilisée pour gérer tout ce qui se passe à l'intérieur des blocs de l'application.
// Elle est initiée lorsque l'application est lancée.
class SimpleBlocObserver extends BlocObserver {
  // Cette méthode est appelée chaque fois qu'un événement est ajouté à un bloc.
  // Elle affiche le type de bloc et l'événement ajouté dans la console.
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('${bloc.runtimeType} $event');
  }

  // Cette méthode est appelée chaque fois que l'état d'un bloc change.
  // Elle affiche le type de bloc et le changement d'état dans la console.
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  // Cette méthode est appelée chaque fois qu'un bloc passe d'un état à un autre.
  // Elle affiche le type de bloc et la transition dans la console.
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('${bloc.runtimeType} $transition');
  }

  // Cette méthode est appelée chaque fois qu'une erreur se produit dans un bloc.
  // Elle affiche le type de bloc, l'erreur et la trace de la pile dans la console.
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
