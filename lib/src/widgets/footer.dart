import 'package:flutter/material.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/app/bloc/app_bloc.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/widgets/chooselanguage.dart';

Widget appFooter(BuildContext context, Locale appLocale, AppBloc? appBloc) {
  return Container(
    alignment: Alignment.bottomCenter,
    width: MediaQuery.of(context).size.width,
    height: 184,
    decoration: const BoxDecoration(color: accentColor),
    child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            S.of(context).confidentialite,
            style: const TextStyle(
                fontSize: 14, fontFamily: "OpenSans-Bold", color: whiteColor),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            S.of(context).conditions,
            style: const TextStyle(
                fontSize: 14, fontFamily: "OpenSans-Bold", color: whiteColor),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            S.of(context).aide,
            style: const TextStyle(
                fontSize: 14, fontFamily: "OpenSans-Bold", color: whiteColor),
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 20),
            child: chooseLanguage(appLocale, appBloc))
      ],
    ),
  );
}
