import 'package:chopper/chopper.dart';
import 'package:get_it/get_it.dart';
import 'package:position/src/core/app/bloc/app_bloc.dart';
import 'package:position/src/core/helpers/network.dart';
import 'package:position/src/core/helpers/sharedpreferences.dart';
import 'package:position/src/core/services/apiService.dart';
import 'package:position/src/core/utils/configs.dart';
import 'package:position/src/modules/auth/api/authApiService.dart';
import 'package:position/src/modules/auth/api/authApiServiceFactory.dart';
import 'package:position/src/modules/auth/blocs/auth/auth_bloc.dart';
import 'package:position/src/modules/auth/blocs/login/login_bloc.dart';
import 'package:position/src/modules/auth/blocs/register/register_bloc.dart';
import 'package:position/src/modules/auth/repositories/authRepository.dart';
import 'package:position/src/modules/auth/repositories/authRepositoryImpl.dart';
import 'package:position/src/modules/gps/bloc/gps_bloc.dart';
import 'package:position/src/modules/map/bloc/map_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  final chopper = ChopperClient(services: [
    ApiService.create()
  ], interceptors: [
    const HeadersInterceptor({'X-Authorization': apiKey})
  ], converter: const JsonConverter(), errorConverter: const JsonConverter());

  final apiService = ApiService.create(chopper);

  //Utils
  getIt.registerLazySingleton<NetworkInfoHelper>(() => NetworkInfoHelper());
  getIt.registerLazySingleton<SharedPreferencesHelper>(
      () => SharedPreferencesHelper());

  //ApiService
  getIt.registerLazySingleton<AuthApiService>(
      () => AuthApiServiceFactory(apiService));

  //Repository
  getIt.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      authApiService: getIt(),
      networkInfoHelper: getIt(),
      sharedPreferencesHelper: getIt(),
    ),
  );

  //Bloc
  getIt.registerFactory<AppBloc>(() => AppBloc());
  getIt.registerFactory<GpsBloc>(() => GpsBloc());
  getIt.registerFactory<AuthBloc>(() =>
      AuthBloc(authRepository: getIt(), sharedPreferencesHelper: getIt()));
  getIt.registerFactory<LoginBloc>(() =>
      LoginBloc(authRepository: getIt(), sharedPreferencesHelper: getIt()));
  getIt.registerFactory<RegisterBloc>(() =>
      RegisterBloc(authRepository: getIt(), sharedPreferencesHelper: getIt()));
  getIt.registerFactory<MapBloc>(() => MapBloc());
}
