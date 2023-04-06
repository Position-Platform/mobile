import 'package:flutter/material.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/modules/map/blocs/map/map_bloc.dart';

Widget filterChip(MapBloc mapBloc) {
  return ChoiceChip(
    selected: false,
    selectedColor: primaryColor,
    disabledColor: transparent,
    labelPadding: const EdgeInsets.all(1.0),
    shape: const StadiumBorder(
        side: BorderSide(
      color: grey2,
    )),
    labelStyle: const TextStyle(color: whiteColor, fontFamily: "OpenSans-Bold"),
    label: const Text(
      "Label",
    ),
    backgroundColor: whiteColor,
    elevation: 0.0,
    shadowColor: transparent,
    padding: const EdgeInsets.all(6.0),
    onSelected: (value) {},
  );
}
