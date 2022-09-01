// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:position/blocobserver.dart';
import 'package:position/src/app.dart';
import 'package:position/src/core/di/di.dart' as di;
import 'package:path_provider/path_provider.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await di.init();
    final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationSupportDirectory(),
    );
    HydratedBlocOverrides.runZoned(() async {
      runApp(const MyApp());
    }, storage: storage, blocObserver: SimpleBlocObserver());
  }, (error, stackTrace) {
    print('runZonedGuarded: Caught error in my root zone.');
    print(stackTrace);
    print(error);
    //  FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}
