// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/src/core/utils/colors.dart';

Widget buttonBottomSheetNoLabel(
    String label, String asset, Color backgroundColor, void Function()? onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: primaryColor)),
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(asset),
                  ],
                ),
              )),
          const SizedBox(
            height: 5,
          ),
          Text(label,
              style: const TextStyle(
                fontFamily: 'OpenSans-Bold',
                color: primaryColor,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              )),
        ],
      ),
    ),
  );
}
