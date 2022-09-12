import 'package:flutter/material.dart';
import 'package:position/src/core/utils/colors.dart';

Widget filterChip(String label, bool isSelected) {
  return ChoiceChip(
    selected: isSelected,
    selectedColor: primaryColor,
    disabledColor: transparent,
    labelPadding: const EdgeInsets.all(1.0),
    shape: const StadiumBorder(
        side: BorderSide(
      color: grey2,
    )),
    labelStyle: TextStyle(
        color: isSelected ? whiteColor : blackColor,
        fontFamily: "OpenSans-Bold"),
    label: Text(
      label,
    ),
    backgroundColor: whiteColor,
    elevation: 0.0,
    shadowColor: transparent,
    padding: const EdgeInsets.all(6.0),
  );
}
