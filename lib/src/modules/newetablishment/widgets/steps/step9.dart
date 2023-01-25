import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';

Widget step9(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      const SizedBox(
        height: 40,
      ),
      SvgPicture.asset(
        'assets/images/svg/bravo.svg',
        height: 140,
        width: 129,
      ),
      const SizedBox(
        height: 30,
      ),
      Text(
        S.of(context).complete_add,
        style: const TextStyle(
            fontFamily: 'OpenSans-Bold',
            color: blackColor,
            fontSize: 14,
            fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 20,
      ),
      Text(
        S.of(context).terms,
        style: const TextStyle(
          fontFamily: 'OpenSans',
          color: blackColor,
          fontSize: 12,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        S.of(context).complete_add_desc,
        style: const TextStyle(
          fontFamily: 'OpenSans',
          color: blackColor,
          fontSize: 12,
        ),
      ),
      const SizedBox(
        height: 100,
      ),
    ],
  );
}
