import 'package:get_it/get_it.dart';
import 'package:position/src/core/app/bloc/app_bloc.dart';
import 'package:position/src/modules/gps/bloc/gps_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
/*  final chopper = ChopperClient(
      services: [ApiService.create()],
      converter: const JsonConverter(),
      errorConverter: const JsonConverter());

  final apiService = ApiService.create(chopper);*/

  //Bloc
  getIt.registerFactory<AppBloc>(() => AppBloc());
  getIt.registerFactory<GpsBloc>(() => GpsBloc());
}
