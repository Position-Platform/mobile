import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/modules/map/submodules/filters/widgets/filterchips.dart';

Widget filterContainer(BuildContext context) {
  return Card(
    elevation: 10,
    margin: EdgeInsets.zero,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Chip(
            labelPadding: const EdgeInsets.all(1.0),
            shape: const StadiumBorder(
                side: BorderSide(
              color: grey2,
            )),
            avatar: CircleAvatar(
              backgroundColor: transparent,
              child: SvgPicture.asset(
                "assets/images/svg/icon-filters.svg",
                height: 15,
                width: 15,
              ),
            ),
            label: const Text(
              "2 filtres",
              style: TextStyle(
                  color: blackColor, fontFamily: "OpenSans-Bold", fontSize: 11),
            ),
            backgroundColor: whiteColor,
            elevation: 0.0,
            shadowColor: transparent,
            padding: const EdgeInsets.all(6.0),
          ),
          const SizedBox(
            width: 10,
          ),
          Wrap(
            spacing: 6.0,
            runSpacing: 6.0,
            children: <Widget>[
              filterChip('Ouvert', false),
              filterChip('Hotels', false),
              filterChip('Agences de voyage', true),
              filterChip('Sports', true),
              filterChip('Nature', false),
              filterChip('Restaurants', false),
              filterChip('Piscines', false),
              filterChip('Fast Food', false),
              filterChip('Mobile Money', true),
              filterChip('Education', false),
              filterChip('Finances', true),
              filterChip('Justice', false),
            ],
          ),
        ],
      ),
    ),
  );
}
