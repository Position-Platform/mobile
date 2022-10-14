// ignore_for_file: must_be_immutable

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/app/bloc/app_bloc.dart';
import 'package:position/src/core/di/di.dart';
import 'package:position/src/modules/gps/views/loading.dart';
import 'package:position/src/modules/map/blocs/map/map_bloc.dart';
import 'package:position/src/modules/map/blocs/search/search_bloc.dart';

class MyApp extends StatelessWidget {
  PendingDynamicLinkData? initialLink;
  MyApp({super.key, @required this.initialLink});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppBloc(),
          ),
          BlocProvider<MapBloc>(
            create: (context) => getIt<MapBloc>(),
          ),
          BlocProvider<SearchBloc>(
            create: (context) => getIt<SearchBloc>(),
          )
        ],
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return MaterialApp(
              title: "Position",
              theme: state.themeData,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              locale: state.locale,
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              home: LoadingPage(
                initialLink: initialLink,
              ),
            );
          },
        ));
  }
}
