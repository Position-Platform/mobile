import 'package:flutter/material.dart';
import 'package:position/src/core/utils/colors.dart';

class AppThemes {
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      scaffoldBackgroundColor: whiteColor,
      primaryColor: primaryColor,
      backgroundColor: whiteColor,
      canvasColor: transparent,
      primaryIconTheme: const IconThemeData(color: blackColor),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          fontFamily: "OpenSans-Bold",
          color: blackColor,
        ),
        bodyText2: TextStyle(
          fontFamily: "OpenSans",
          color: blackColor,
        ),
      ),
      colorScheme: const ColorScheme.light(
          primary: primaryColor, secondary: accentColor),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: accentColor),
    ),
    AppTheme.darkTheme: ThemeData(
      scaffoldBackgroundColor: blackColor,
      primaryColor: primaryDarkColor,
      backgroundColor: blackColor,
      canvasColor: transparent,
      primaryIconTheme: const IconThemeData(color: whiteColor),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          fontFamily: "OpenSans-Bold",
          color: whiteColor,
        ),
        bodyText2: TextStyle(
          fontFamily: "OpenSans",
          color: whiteColor,
        ),
      ),
      colorScheme: const ColorScheme.light(
          primary: primaryDarkColor, secondary: accentColor),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: accentColor),
    )
  };
}

enum AppTheme {
  lightTheme,
  darkTheme,
}
