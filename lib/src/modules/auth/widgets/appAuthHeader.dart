// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAuthHeader extends StatelessWidget {
  const AppAuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Image.asset(
          "assets/images/png/logo-nom.png",
          height: 56,
          width: 150,
        ),
        const SizedBox(
          height: 37,
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 50,
            right: 50,
          ),
          child: SvgPicture.asset("assets/images/svg/welcome-large.svg"),
        ),
      ],
    );
  }
}
