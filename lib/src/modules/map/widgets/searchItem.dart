// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/modules/map/models/search_model/search_model.dart';

Widget searchItem(BuildContext context, SearchModel searchModel) {
  return ListTile(
    leading: searchModel.type == "etablissement"
        ? SvgPicture.asset("assets${searchModel.logo!}", height: 30, width: 30)
        : searchModel.type == "nominatim"
            ? CachedNetworkImage(
                imageUrl: searchModel.logo!,
                height: 30,
                width: 30,
              )
            : SvgPicture.network(searchModel.logo!, height: 30, width: 30),
    title: Text(
      searchModel.name!,
      style: const TextStyle(fontFamily: "OpenSans-Bold", fontSize: 14),
    ),
    subtitle: searchModel.type != "categorie"
        ? Text(
            "${searchModel.details!} , ${searchModel.distance!} km",
            style: const TextStyle(
                fontFamily: "OpenSans-Bold", color: grey5, fontSize: 12),
          )
        : Text(
            searchModel.details!,
            style: const TextStyle(
                fontFamily: "OpenSans-Bold", color: grey5, fontSize: 12),
          ),
    isThreeLine: true,
    trailing: searchModel.type == "etablissement" &&
            searchModel.etablissement!.horaires!.isNotEmpty
        ? searchModel.isOpenNow!
            ? Text(S.of(context).open,
                style: const TextStyle(
                    fontFamily: "OpenSans-Bold",
                    fontSize: 12,
                    color: primaryColor))
            : Text(S.of(context).closed,
                style: const TextStyle(
                    fontFamily: "OpenSans-Bold", fontSize: 12, color: redColor))
        : null,
  );
}
