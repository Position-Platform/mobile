import 'package:flutter/material.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/modules/map/blocs/map/map_bloc.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/commodites_model/commodite.dart';

Widget filterChip(Commodite commodite, MapBloc mapBloc) {
  return ChoiceChip(
    selected: commodite.isSelected,
    selectedColor: primaryColor,
    disabledColor: transparent,
    labelPadding: const EdgeInsets.all(1.0),
    shape: const StadiumBorder(
        side: BorderSide(
      color: grey2,
    )),
    labelStyle: TextStyle(
        color: commodite.isSelected ? whiteColor : blackColor,
        fontFamily: "OpenSans-Bold"),
    label: Text(
      commodite.nom!,
    ),
    backgroundColor: whiteColor,
    elevation: 0.0,
    shadowColor: transparent,
    padding: const EdgeInsets.all(6.0),
    onSelected: (value) {
      commodite.isSelected = value;
      mapBloc.add(SelectChips(commodite));
    },
  );
}
