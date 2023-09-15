// ignore_for_file: must_be_immutable

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/di/di.dart';
import 'package:position/src/modules/auth/blocs/auth/auth_bloc.dart';
import 'package:position/src/modules/auth/blocs/login/login_bloc.dart';
import 'package:position/src/modules/auth/views/login.dart';
import 'package:position/src/modules/auth/views/resetpassword.dart';
import 'package:position/src/modules/map/views/map.dart';
import 'package:position/src/onboarding.dart';
import 'package:position/src/splash.dart';
import 'package:position/src/widgets/error.dart';

class InitPage extends StatelessWidget {
  // Propriété pour stocker les données de lien dynamique en attente
  PendingDynamicLinkData? initialLink;

  // Constructeur de la classe InitPage
  InitPage({Key? key, @required this.initialLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Utilisation d'un BlocBuilder pour écouter les changements d'état du AuthBloc
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        // Si l'état est AuthInitial, afficher l'écran de chargement
        if (state is AuthInitial) {
          return const SplashScreen();
        }
        // Si l'état est AuthFirstOpen, afficher l'écran d'introduction
        if (state is AuthFirstOpen) {
          return const OnboardingScreen();
        }
        // Si l'état est AuthFailure, vérifier si initialLink est différent de null
        if (state is AuthFailure) {
          if (initialLink != null) {
            // Récupérer les paramètres de lien dynamique
            final Uri deepLink = initialLink!.link;

            // Vérifier si le paramètre resettoken est présent
            var token = deepLink.queryParameters['resettoken']!;

            if (token.isNotEmpty) {
              // Si resettoken est présent, afficher la page de réinitialisation de mot de passe
              return BlocProvider<LoginBloc>(
                create: (context) => getIt<LoginBloc>(),
                child: ResetPassword(
                  token: token,
                ),
              );
            } else {
              // Sinon, afficher la page de connexion
              return BlocProvider<LoginBloc>(
                create: (context) => getIt<LoginBloc>(),
                child: const LoginPage(),
              );
            }
          } else {
            // Si initialLink est null, afficher la page de connexion
            return BlocProvider<LoginBloc>(
              create: (context) => getIt<LoginBloc>(),
              child: const LoginPage(),
            );
          }
        }
        // Si l'état est AuthSuccess, afficher la carte avec la position de l'utilisateur
        if (state is AuthSuccess) {
          return MapPage(
            user: state.user,
            initialLink: initialLink,
          );
        }
        // Si l'état est AuthNoInternet, afficher un message d'erreur indiquant que l'application n'a pas accès à Internet
        if (state is AuthNoInternet) {
          return errorWidget(context, S.of(context).noInternet,
              () => BlocProvider.of<AuthBloc>(context).add(AuthStarted()));
        }
        // Si l'état est AuthServerError, afficher un message d'erreur indiquant qu'il y a eu une erreur de serveur
        if (state is AuthServerError) {
          return errorWidget(context, S.of(context).serverError,
              () => BlocProvider.of<AuthBloc>(context).add(AuthStarted()));
        }

        // Par défaut, afficher l'écran de chargement
        return const SplashScreen();
      },
    );
  }
}
