// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/src/core/utils/configs.dart';
import 'package:position/src/modules/map/blocs/map/map_bloc.dart';
import 'package:position/src/modules/map/models/search_model/search_model.dart';

Widget headerBottomSheet(SearchModel searchModel, MapBloc mapBloc) {
  return Stack(
    children: [
      CarouselSlider(
          items: searchModel.etablissement!.images!
              .map((item) => Container(
                  alignment: Alignment.topLeft,
                  child: Image.network(
                    apiUrl + item.imageUrl!,
                    fit: BoxFit.cover,
                    width: 170,
                    height: 150,
                  )))
              .toList(),
          options: CarouselOptions(
            height: 90,
            enableInfiniteScroll: true,
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.3,
          )),
      Positioned(
          top: 15,
          right: 10,
          child: InkWell(
            onTap: () {
              mapBloc.add(CloseExpanded());
            },
            child: SvgPicture.asset(
              "assets/images/svg/button-button-close-round.svg",
              height: 20,
              width: 20,
            ),
          )),
    ],
  );
}
