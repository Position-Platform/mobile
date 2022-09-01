import 'package:get_it/get_it.dart';
import 'package:position/src/core/app/themes/bloc/theme_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
/*  final chopper = ChopperClient(
      services: [ApiService.create()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter());

  final apiService = ApiService.create(chopper);*/

  //Bloc
  getIt.registerFactory<ThemeBloc>(() => ThemeBloc());
}
