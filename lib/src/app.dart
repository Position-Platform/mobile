// ignore_for_file: must_be_immutable

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/navigatorobserver.dart';
import 'package:position/src/core/app/bloc/app_bloc.dart';
import 'package:position/src/core/di/di.dart';
import 'package:position/src/modules/gps/views/loading.dart';
import 'package:position/src/modules/map/blocs/map/map_bloc.dart';
import 'package:position/src/modules/map/blocs/search/search_bloc.dart';

class MyApp extends StatelessWidget {
  // Le paramètre initialLink est utilisé pour stocker les données d'un lien dynamique en attente de traitement.
  PendingDynamicLinkData? initialLink;

  // Le constructeur prend un paramètre initialLink et appelle le constructeur de la classe parent avec la clé et le paramètre initialLink.
  MyApp({super.key, @required this.initialLink});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          // Le bloc AppBloc est fourni à l'ensemble de l'application.
          BlocProvider(
            create: (context) => AppBloc(),
          ),
          // Les blocs MapBloc et SearchBloc sont fournis aux widgets enfants qui en ont besoin.
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
              navigatorObservers: [MyNavigatorObserver()],
              // Le titre de l'application.
              title: "Position",
              // Le thème de l'application est défini en fonction de l'état actuel de l'application.
              theme: state.themeData,
              // Les délégués de localisation sont utilisés pour traduire le texte de l'application dans la langue préférée de l'utilisateur.
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              // La langue préférée de l'utilisateur est définie en fonction de l'état actuel de l'application.
              locale: state.locale,
              // La liste des langues que l'application prend en charge.
              supportedLocales: S.delegate.supportedLocales,
              // Désactive la bannière de débogage.
              debugShowCheckedModeBanner: false,
              // Le widget LoadingPage est affiché en tant que page d'accueil de l'application.
              home: LoadingPage(
                initialLink: initialLink,
              ),
            );
          },
        ));
  }
}
