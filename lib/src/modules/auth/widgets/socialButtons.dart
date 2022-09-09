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
      ),
      const SizedBox(
        width: 50,
      ),
      _buildLogoButton(
        image: 'assets/images/png/facebook_logo.png',
        onPressed: () {
          loginBloc?.add(LoginWithFacebookPressed());
        },
      )
    ],
  );
}

Widget _buildLogoButton({
  required String image,
  required VoidCallback onPressed,
}) {
  return FloatingActionButton(
    backgroundColor: Colors.white,
    onPressed: onPressed,
    child: SizedBox(
      height: 30,
      child: Image.asset(image),
    ),
  );
}
