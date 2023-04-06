import 'package:flutter/material.dart';
import 'package:position/src/core/utils/colors.dart';

class AppThemes {
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      scaffoldBackgroundColor: whiteColor,
      primaryColor: primaryColor,
      canvasColor: whiteColor,
      primaryIconTheme: const IconThemeData(color: blackColor),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontFamily: "OpenSans-Bold",
          color: blackColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: "OpenSans",
          color: blackColor,
        ),
      ),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: accentColor),
      colorScheme:
          const ColorScheme.light(primary: primaryColor, secondary: accentColor)
              .copyWith(background: whiteColor),
    ),
    AppTheme.darkTheme: ThemeData(
      scaffoldBackgroundColor: blackColor,
      primaryColor: primaryDarkColor,
      canvasColor: blackColor,
      primaryIconTheme: const IconThemeData(color: whiteColor),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontFamily: "OpenSans-Bold",
          color: whiteColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: "OpenSans",
          color: whiteColor,
        ),
      ),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: accentColor),
      colorScheme: const ColorScheme.light(
              primary: primaryDarkColor, secondary: accentColor)
          .copyWith(background: blackColor),
    )
  };
}

enum AppTheme {
  lightTheme,
  darkTheme,
}
