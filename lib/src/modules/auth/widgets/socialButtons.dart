// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget buildSocialButtons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _buildLogoButton(
        image: 'assets/images/png/google_logo.png',
        onPressed: () {},
      ),
      const SizedBox(
        width: 50,
      ),
      _buildLogoButton(
        image: 'assets/images/png/facebook_logo.png',
        onPressed: () {},
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
