// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:position/src/modules/auth/blocs/login/login_bloc.dart';

Widget buildSocialButtons(LoginBloc? loginBloc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildLogoButton(
          image: 'assets/images/png/google_logo.png',
          onPressed: () {
            loginBloc?.add(LoginWithGooglePressed());
          },
          tag: "google"),
      const SizedBox(
        width: 50,
      ),
      _buildLogoButton(
          image: 'assets/images/png/facebook_logo.png',
          onPressed: () {
            loginBloc?.add(LoginWithFacebookPressed());
          },
          tag: "facebook")
    ],
  );
}

Widget _buildLogoButton({
  required String image,
  required VoidCallback onPressed,
  required String tag,
}) {
  return FloatingActionButton(
    heroTag: tag,
    backgroundColor: Colors.white,
    onPressed: onPressed,
    child: SizedBox(
      height: 30,
      child: Image.asset(image),
    ),
  );
}
