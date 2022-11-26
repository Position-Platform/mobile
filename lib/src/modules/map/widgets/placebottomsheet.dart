import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/functions.dart';
import 'package:position/src/modules/map/blocs/map/map_bloc.dart';
import 'package:position/src/modules/map/models/search_model/search_model.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/commodites_model/commodite.dart';
import 'package:position/src/modules/map/widgets/bottomSheetButton.dart';
import 'package:position/src/modules/map/widgets/headerbottomSheet.dart';

Widget placeBottomSheet(
    BuildContext context, SearchModel searchModel, MapBloc mapBloc) {
  return BlocBuilder<MapBloc, MapState>(
    builder: (context, state) {
      return Column(
        children: [
          searchModel.type! == "etablissement"
              ? headerBottomSheet(searchModel, mapBloc)
              : const SizedBox(),
          Container(
            height: 160,
            color: whiteColor,
            child: Column(
              children: [
                searchModel.type! == "etablissement"
                    ? SvgPicture.asset(
                        "assets/images/svg/horizontal-bar.svg",
                        height: 30,
                        color: grey5,
                      )
                    : const SizedBox(
                        height: 30,
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
                                  fontFamily: "OpenSans-Bold", fontSize: 12),
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
                                          fontSize: 10),
                                    ),
                                    RatingBar.builder(
                                      ignoreGestures: true,
                                      itemSize: 10,
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
                                              fontFamily: "OpenSans",
                                              fontSize: 12),
                                        ),
                                        Text(
                                          S.of(context).avis,
                                          style: const TextStyle(
                                              fontFamily: "OpenSans",
                                              fontSize: 12),
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
                              whiteColor, () {
                              makePhoneCall(searchModel.etablissement!.phone!);
                            }),
                      buttonBottomSheet(
                          S.of(context).routing,
                          "assets/images/svg/icon-action-vignette-itinéraire.svg",
                          whiteColor,
                          primaryColor, () {
                        mapBloc.add(AddRoutingInMap(
                            searchModel.longitude, searchModel.latitude));
                      }),
                      buttonBottomSheet(
                          S.of(context).share,
                          "assets/images/svg/icon-action-vignette-partager.svg",
                          whiteColor,
                          primaryColor, () {
                        mapBloc.add(SharePlace(searchModel));
                      }),
                      searchModel.type! == "nominatim"
                          ? const SizedBox()
                          : searchModel.etablissement!.isFavoris! ||
                                  state is FavoriteAdded
                              ? buttonBottomSheet(
                                  S.of(context).saved,
                                  "assets/images/svg/icon-action-vignette-remove.svg",
                                  primaryColor,
                                  whiteColor, () {
                                  mapBloc.add(RemoveFavorite(
                                      searchModel.etablissement!.id));
                                })
                              : buttonBottomSheet(
                                  S.of(context).save,
                                  "assets/images/svg/icon-action-vignette-enregistrer.svg",
                                  whiteColor,
                                  primaryColor, () {
                                  mapBloc.add(AddFavorite(
                                      searchModel.etablissement!.id));
                                }),
                      const SizedBox(
                        width: 10,
                      ),
                      searchModel.type! == "nominatim"
                          ? Container(
                              alignment: Alignment.center,
                              width: 105,
                              height: 35,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                      color: shadow1,
                                      offset: Offset(0, 1),
                                      blurRadius: 8,
                                      spreadRadius: 0),
                                  BoxShadow(
                                      color: shadow2,
                                      offset: Offset(0, 3),
                                      blurRadius: 3,
                                      spreadRadius: -2),
                                  BoxShadow(
                                      color: shadow3,
                                      offset: Offset(0, 3),
                                      blurRadius: 4,
                                      spreadRadius: 0)
                                ],
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(S.of(context).addEtablissement,
                                    style: const TextStyle(
                                      fontFamily: 'OpenSans-Bold',
                                      color: whiteColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    )),
                              ))
                          : const SizedBox(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      );
    },
  );
}

List<Widget> buildCommodites(List<Commodite> commodites) {
  List<Widget> items = [];
  for (var i = 0; i < commodites.length; i++) {
    Widget item = Row(
      children: [
        SvgPicture.asset(
          "assets/images/svg/icon-service-check.svg",
        ),
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
