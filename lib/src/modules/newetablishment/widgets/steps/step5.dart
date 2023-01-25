import 'package:flutter/material.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/commodites_model/commodite.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/type_commodites_model/types_commodite.dart';

Widget step5(BuildContext context, List<TypesCommodite>? typesCommodites) {
  return Container(
    color: whiteColor,
    child: Column(
      children: buildTypesCommodites(typesCommodites!),
    ),
  );
}

List<Widget> buildTypesCommodites(List<TypesCommodite> typesCommodites) {
  List<Widget> items = [];
  for (var i = 0; i < typesCommodites.length; i++) {
    Widget item = Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(left: 20),
          child: Text(typesCommodites[i].nom!,
              style: const TextStyle(
                fontFamily: 'OpenSans',
                color: greyColor,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(left: 20),
          child: Wrap(
            spacing: 6.0,
            runSpacing: 6.0,
            children: buildCommodites(typesCommodites[i].commodites!),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
    items.add(item);
  }
  return items;
}

List<Widget> buildCommodites(List<Commodite> commodites) {
  List<Widget> items = [];
  for (var i = 0; i < commodites.length; i++) {
    Widget item = ChoiceChip(
      selected: false,
      selectedColor: primaryColor,
      disabledColor: transparent,
      labelPadding: const EdgeInsets.all(1.0),
      shape: const StadiumBorder(
          side: BorderSide(
        color: grey2,
      )),
      labelStyle: const TextStyle(
          color: grey97, fontSize: 12, fontFamily: "OpenSans-Bold"),
      label: Text(
        commodites[i].nom!,
      ),
      backgroundColor: whiteColor,
      elevation: 0.0,
      shadowColor: transparent,
      padding: const EdgeInsets.all(6.0),
      onSelected: (value) {},
    );
    items.add(item);
  }
  return items;
}
