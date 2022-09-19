// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/sizes.dart';

Widget buttonBottomSheet(
    String label, String asset, Color backgroundColor, Color textColor) {
  return Container(
      width: 110,
      height: 35,
      margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: primaryColor)),
      child: Container(
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 5),
            SvgPicture.asset(asset),
            const SizedBox(width: 5),
            Text(label,
                style: TextStyle(
                  fontFamily: 'OpenSans-Bold',
                  color: textColor,
                  fontSize: textSize,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                )),
          ],
        ),
      ));
}
