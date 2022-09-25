import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/modules/map/models/search_model/search_model.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/commodite.dart';
import 'package:position/src/modules/map/widgets/bottomSheetButton.dart';
import 'package:position/src/modules/map/widgets/headerbottomSheet.dart';

Widget placeBottomSheet(BuildContext context, SearchModel searchModel) {
  return Column(
    children: [
      searchModel.type! == "etablissement"
          ? headerBottomSheet(searchModel)
          : const SizedBox(),
      Container(
        height: 150,
        color: whiteColor,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          searchModel.name!,
                          style: const TextStyle(
                              fontFamily: "OpenSans-Bold", fontSize: 14),
                        ),
                      ),
                      searchModel.type! == "etablissement"
                          ? Row(
                              children: [
                                Text(
                                  searchModel.etablissement!.moyenne!
                                      .toString(),
                                  style: const TextStyle(
                                      fontFamily: "OpenSans-Bold",
                                      fontSize: 12),
                                ),
                                RatingBar.builder(
                                  itemSize: 12,
                                  initialRating: double.parse(searchModel
                                      .etablissement!.moyenne
                                      .toString()),
                                  minRating: 0,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: accentColor,
                                  ),
                                  onRatingUpdate: (rating) {
                                    //  print(rating);
                                  },
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${searchModel.etablissement!.avis} ",
                                      style: const TextStyle(
                                          fontFamily: "OpenSans", fontSize: 14),
                                    ),
                                    Text(
                                      S.of(context).avis,
                                      style: const TextStyle(
                                          fontFamily: "OpenSans", fontSize: 14),
                                    ),
                                  ],
                                )
                              ],
                            )
                          : const SizedBox()
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(searchModel.details!,
                      style: const TextStyle(
                          color: greyColor,
                          fontSize: 12,
                          fontFamily: "OpenSans")),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            searchModel.type! == "etablissement"
                ? Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: buildCommodites(
                          searchModel.etablissement!.commodites!),
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  searchModel.type! == "nominatim"
                      ? const SizedBox()
                      : buttonBottomSheet(
                          S.of(context).contacter,
                          "assets/images/svg/icon-action-vignette-appeler.svg",
                          primaryColor,
                          whiteColor),
                  buttonBottomSheet(
                      S.of(context).routing,
                      "assets/images/svg/icon-action-vignette-itinéraire.svg",
                      whiteColor,
                      primaryColor),
                  buttonBottomSheet(
                      S.of(context).share,
                      "assets/images/svg/icon-action-vignette-partager.svg",
                      whiteColor,
                      primaryColor),
                  searchModel.type! == "nominatim"
                      ? const SizedBox()
                      : searchModel.etablissement!.isFavoris!
                          ? buttonBottomSheet(
                              S.of(context).saved,
                              "assets/images/svg/icon-action-vignette-remove.svg",
                              primaryColor,
                              whiteColor)
                          : buttonBottomSheet(
                              S.of(context).save,
                              "assets/images/svg/icon-action-vignette-enregistrer.svg",
                              whiteColor,
                              primaryColor),
                ],
              ),
            )
          ],
        ),
      ),
    ],
  );
}

List<Widget> buildCommodites(List<Commodite> commodites) {
  List<Widget> items = [];
  for (var i = 0; i < commodites.length; i++) {
    Widget item = Row(
      children: [
        SvgPicture.asset("assets/images/svg/icon-service-check.svg"),
        const SizedBox(
          width: 3,
        ),
        Text(
          commodites[i].nom!,
          style: const TextStyle(fontFamily: "OpenSans", fontSize: 11),
        )
      ],
    );
    items.add(item);
  }
  return items;
}
