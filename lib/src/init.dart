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
  PendingDynamicLinkData? initialLink;
  InitPage({Key? key, @required this.initialLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          return const SplashScreen();
        }
        if (state is AuthFirstOpen) {
          return const OnboardingScreen();
        }
        if (state is AuthFailure) {
          if (initialLink != null) {
            final Uri deepLink = initialLink!.link;

            var token = deepLink.queryParameters['resettoken']!;

            if (token.isNotEmpty) {
              return BlocProvider<LoginBloc>(
                create: (context) => getIt<LoginBloc>(),
                child: ResetPassword(
                  token: token,
                ),
              );
            } else {
              return BlocProvider<LoginBloc>(
                create: (context) => getIt<LoginBloc>(),
                child: const LoginPage(),
              );
            }
          } else {
            return BlocProvider<LoginBloc>(
              create: (context) => getIt<LoginBloc>(),
              child: const LoginPage(),
            );
          }
        }
        if (state is AuthSuccess) {
          return MapPage(
            user: state.user,
            initialLink: initialLink,
          );
        }
        if (state is AuthNoInternet) {
          return errorWidget(context, S.of(context).noInternet,
              () => BlocProvider.of<AuthBloc>(context).add(AuthStarted()));
        }
        if (state is AuthServerError) {
          return errorWidget(context, S.of(context).serverError,
              () => BlocProvider.of<AuthBloc>(context).add(AuthStarted()));
        }

        return const SplashScreen();
      },
    );
  }
}
