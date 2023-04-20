import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/src/core/utils/colors.dart';

Widget buildChip(String label, String icon, VoidCallback callback) {
  return InkWell(
    onTap: callback,
    highlightColor: transparent,
    child: Chip(
      labelPadding: const EdgeInsets.all(1.0),
      shape: const StadiumBorder(
          side: BorderSide(
        color: grey2,
      )),
      avatar: CircleAvatar(
        backgroundColor: transparent,
        child: SvgPicture.asset(
          "assets$icon",
          height: 15,
          width: 15,
        ),
      ),
      label: Text(
        label,
        style: const TextStyle(
            color: Colors.black, fontFamily: "OpenSans-Bold", fontSize: 11),
      ),
      backgroundColor: whiteColor,
      elevation: 0.0,
      shadowColor: transparent,
      padding: const EdgeInsets.all(6.0),
    ),
  );
}
