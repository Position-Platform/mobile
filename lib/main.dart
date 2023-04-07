// ignore_for_file: avoid_print

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:position/blocobserver.dart';
import 'package:position/firebase_options.dart';
import 'package:position/src/app.dart';
import 'package:position/src/core/di/di.dart' as di;
import 'package:path_provider/path_provider.dart';
import 'package:position/src/modules/gps/bloc/gps_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  runZonedGuarded(() async {
    // Initialisation de tous les widgets
    WidgetsFlutterBinding.ensureInitialized();
    // Initialisation des variables d'environement
    await dotenv.load(fileName: ".env");
    // Initialisation des dependences via getIt
    await di.init();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationSupportDirectory(),
    );
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();

    HydratedBlocOverrides.runZoned(() async {
      runApp(BlocProvider(
        create: (_) => di.getIt<GpsBloc>(),
        child: MyApp(
          initialLink: initialLink,
        ),
      ));
    }, storage: storage, blocObserver: SimpleBlocObserver());
  }, (error, stackTrace) {
    print('runZonedGuarded: Caught error in my root zone.');
    print(stackTrace);
    print(error);
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}
