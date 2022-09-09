// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/src/core/utils/colors.dart';

Widget searchItem() {
  return ListTile(
    leading: SvgPicture.asset("assets/images/svg/icon-help.svg",
        height: 30, width: 30, color: primaryColor),
    title: const Text(
      "Tourisme",
      style: TextStyle(fontFamily: "OpenSans-Bold", fontSize: 14),
    ),
    subtitle: const Text(
      "Categorie",
      style: TextStyle(fontFamily: "OpenSans-Bold", color: grey5, fontSize: 12),
    ),
  );
}
