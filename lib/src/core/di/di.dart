import 'package:chopper/chopper.dart';
import 'package:get_it/get_it.dart';
import 'package:position/src/core/app/bloc/app_bloc.dart';
import 'package:position/src/core/database/db.dart';
import 'package:position/src/core/helpers/network.dart';
import 'package:position/src/core/helpers/sharedpreferences.dart';
import 'package:position/src/core/services/apiService.dart';
import 'package:position/src/core/services/nominatimService.dart';
import 'package:position/src/core/services/routingService.dart';
import 'package:position/src/core/utils/configs.dart';
import 'package:position/src/modules/auth/api/authApiService.dart';
import 'package:position/src/modules/auth/api/authApiServiceFactory.dart';
import 'package:position/src/modules/auth/blocs/auth/auth_bloc.dart';
import 'package:position/src/modules/auth/blocs/login/login_bloc.dart';
import 'package:position/src/modules/auth/blocs/register/register_bloc.dart';
import 'package:position/src/modules/auth/db/user.dao.dart';
import 'package:position/src/modules/auth/repositories/authRepository.dart';
import 'package:position/src/modules/auth/repositories/authRepositoryImpl.dart';
import 'package:position/src/modules/gps/bloc/gps_bloc.dart';
import 'package:position/src/modules/map/blocs/map/map_bloc.dart';
import 'package:position/src/modules/map/blocs/search/search_bloc.dart';
import 'package:position/src/modules/map/submodules/categories/api/categoriesApiService.dart';
import 'package:position/src/modules/map/submodules/categories/api/categoriesApiServiceFactory.dart';
import 'package:position/src/modules/map/submodules/categories/db/category.dao.dart';
import 'package:position/src/modules/map/submodules/categories/repositories/categoriesRepository.dart';
import 'package:position/src/modules/map/submodules/categories/repositories/categoriesRepositoryImpl.dart';
import 'package:position/src/modules/map/submodules/etablissements/api/etablissementApiService.dart';
import 'package:position/src/modules/map/submodules/etablissements/api/etablissementApiServiceFactory.dart';
import 'package:position/src/modules/map/submodules/etablissements/db/etablissement.dao.dart';
import 'package:position/src/modules/map/submodules/etablissements/repository/etablissementRepository.dart';
import 'package:position/src/modules/map/submodules/etablissements/repository/etablissementRepositoryImpl.dart';
import 'package:position/src/modules/map/submodules/nominatim/api/nominatimApiService.dart';
import 'package:position/src/modules/map/submodules/nominatim/api/nominatimApiServiceFactory.dart';
import 'package:position/src/modules/map/submodules/nominatim/repository/nominatimRepository.dart';
import 'package:position/src/modules/map/submodules/nominatim/repository/nominatimRepositoryImpl.dart';
import 'package:position/src/modules/map/submodules/search/db/search.dao.dart';
import 'package:position/src/modules/map/submodules/tracking/api/trackingApiService.dart';
import 'package:position/src/modules/map/submodules/tracking/api/trackingApiServiceFactory.dart';
import 'package:position/src/modules/map/submodules/tracking/repository/trackingRepository.dart';
import 'package:position/src/modules/map/submodules/tracking/repository/trackingRepositoryImpl.dart';
import 'package:position/src/modules/newetablishment/blocs/new_etablishment/new_etablishment_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  // Création du client Chopper avec les différents services et intercepteurs
  final chopper = ChopperClient(services: [
    ApiService.create(),
    NominatimService.create(),
    RoutingService.create()
  ], interceptors: [
    HttpLoggingInterceptor(level: Level.body),
    CurlInterceptor(),
    HeadersInterceptor({'X-Authorization': apiKey!})
  ], converter: const JsonConverter(), errorConverter: const JsonConverter());

  // Création des instances des différents services
  final apiService = ApiService.create(chopper);
  final nominatimService = NominatimService.create(chopper);
  final routingService = RoutingService.create(chopper);

  //Utils
  // Enregistrement des instances des différents helpers
  getIt.registerLazySingleton<NetworkInfoHelper>(() => NetworkInfoHelper());
  getIt.registerLazySingleton<SharedPreferencesHelper>(
      () => SharedPreferencesHelper());

  //ApiService
  // Enregistrement des instances des différents services d'API
  getIt.registerLazySingleton<AuthApiService>(
      () => AuthApiServiceFactory(apiService));

  getIt.registerLazySingleton<CategoriesApiService>(
      () => CategoriesApiServiceFactory(apiService));

  getIt.registerLazySingleton<TrackingApiService>(
      () => TrackingApiServiceFactory(apiService));

  getIt.registerLazySingleton<EtablissementApiService>(
      () => EtablissementApiServiceFactory(apiService));

  getIt.registerLazySingleton<NominatimApiService>(
      () => NominatimApiServiceFactory(nominatimService, routingService));

  // Database
  // Enregistrement des instances des DAO pour accéder à la base de données
  getIt.registerLazySingleton<MyDatabase>(() => MyDatabase());
  getIt.registerLazySingleton<UserDao>(() => UserDao(getIt()));
  getIt.registerLazySingleton<SearchDao>(() => SearchDao(getIt()));
  getIt.registerLazySingleton<CategoryDao>(() => CategoryDao(getIt()));
  getIt
      .registerLazySingleton<EtablissementDao>(() => EtablissementDao(getIt()));

  //Repository
  // Enregistrement des instances des différents repositories
  getIt.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
        authApiService: getIt(),
        networkInfoHelper: getIt(),
        sharedPreferencesHelper: getIt(),
        userDao: getIt()),
  );

  getIt.registerFactory<CategoriesRepository>(
    () => CategoriesRepositoryImpl(
        categoriesApiService: getIt(),
        networkInfoHelper: getIt(),
        sharedPreferencesHelper: getIt(),
        categoryDao: getIt()),
  );

  getIt.registerFactory<TrackingRepository>(
    () => TrackingRepositoryImpl(
      trackingApiService: getIt(),
      networkInfoHelper: getIt(),
      sharedPreferencesHelper: getIt(),
    ),
  );

  getIt.registerFactory<EtablissementRepository>(
    () => EtablissementRepositoryImpl(
        etablissementApiService: getIt(),
        networkInfoHelper: getIt(),
        sharedPreferencesHelper: getIt(),
        userDao: getIt(),
        etablissementDao: getIt()),
  );

  getIt.registerFactory<NominatimRepository>(
    () => NominatimRepositoryImpl(
      nominatimApiService: getIt(),
      networkInfoHelper: getIt(),
    ),
  );

  //Bloc
  // Enregistrement des instances des différents blocs
  getIt.registerFactory<AppBloc>(() => AppBloc());
  getIt.registerFactory<GpsBloc>(() => GpsBloc());
  getIt.registerFactory<AuthBloc>(() =>
      AuthBloc(authRepository: getIt(), sharedPreferencesHelper: getIt()));
  getIt.registerFactory<LoginBloc>(() =>
      LoginBloc(authRepository: getIt(), sharedPreferencesHelper: getIt()));
  getIt.registerFactory<RegisterBloc>(() =>
      RegisterBloc(authRepository: getIt(), sharedPreferencesHelper: getIt()));
  getIt.registerFactory<MapBloc>(() => MapBloc(
      categoriesRepository: getIt(),
      sharedPreferencesHelper: getIt(),
      trackingRepository: getIt(),
      nominatimRepository: getIt(),
      etablissementRepository: getIt()));
  getIt.registerFactory<SearchBloc>(() => SearchBloc(
      searchDao: getIt(),
      categoriesRepository: getIt(),
      etablissementRepository: getIt(),
      nominatimRepository: getIt()));

  getIt.registerFactory<NewEtablishmentBloc>(
      // Enregistrement de l'instance du bloc NewEtablishmentBloc
      () => NewEtablishmentBloc(maxSteps: 9));
}
