// ignore_for_file: avoid_print

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:position/blocobserver.dart';
import 'package:position/firebase_options.dart';
import 'package:position/src/app.dart';
import 'package:position/src/core/di/di.dart' as di;
import 'package:path_provider/path_provider.dart';
import 'package:position/src/core/utils/workmanager.dart';
import 'package:position/src/modules/gps/bloc/gps_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  runZonedGuarded(() async {
    // Initialisation de tous les widgets
    WidgetsFlutterBinding.ensureInitialized();
    // Initialisation des variables d'environement
    await dotenv.load(fileName: ".env");
    // Initialisation des dependences via getIt
    await di.init();
    // Initialisation de Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // Récupération du lien dynamique initial
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();

    FirebasePerformance.instance;

    // Configuration de HydratedBloc pour la persistance de l'état
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory(),
    );
    // Configuration de l'observateur de BLoC
    Bloc.observer = SimpleBlocObserver();

    // Initialisation de Workmanager pour la planification de tâches en arrière-plan
    Workmanager().initialize(callbackDispatcher);
    Workmanager().registerPeriodicTask("1", "addtracking",
        frequency: const Duration(minutes: 15),
        constraints: Constraints(networkType: NetworkType.connected));

    // Lancement de l'application
    runApp(BlocProvider(
      create: (_) => di.getIt<GpsBloc>(),
      child: MyApp(
        initialLink: initialLink,
      ),
    ));
  }, (error, stackTrace) {
    // Gestion des erreurs avec Firebase Crashlytics
    print('runZonedGuarded: Caught error in my root zone.');
    print(stackTrace);
    print(error);
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}
