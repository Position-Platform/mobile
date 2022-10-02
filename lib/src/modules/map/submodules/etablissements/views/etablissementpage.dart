import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/configs.dart';
import 'package:position/src/modules/map/blocs/map/map_bloc.dart';
import 'package:position/src/modules/map/models/search_model/search_model.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/commentaire.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/horaire.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/image.dart'
    as image;
import 'package:position/src/modules/map/submodules/etablissements/widgets/etablissementcomment.dart';
import 'package:position/src/modules/map/submodules/etablissements/widgets/etablissementreview.dart';
import 'package:position/src/modules/map/widgets/bottomSheetButtonNoLabel.dart';
import 'package:position/src/modules/map/widgets/placebottomsheet.dart';

bool isVisible = true;

Widget etablissementPage(BuildContext context, SearchModel searchModel,
    MapBloc mapBloc, GlobalKey<ExpandableBottomSheetState> expandablesheet) {
  searchModel.etablissement!.images!.add(image.Image(
      etablissementId: searchModel.etablissement!.id,
      imageUrl: searchModel.etablissement!.cover));
  return Container(
    color: whiteColor,
    height: MediaQuery.of(context).size.height,
    child: SingleChildScrollView(
      child: Column(
        children: [
          Stack(children: [
            CarouselSlider(
                items: searchModel.etablissement!.images!
                    .map((item) => Container(
                        alignment: Alignment.topLeft,
                        child: Image.network(
                          apiUrl + item.imageUrl!,
                          fit: BoxFit.cover,
                          width: 160,
                          height: 170,
                        )))
                    .toList(),
                options: CarouselOptions(
                  height: 170,
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal,
                  viewportFraction: 0.3,
                )),
            Positioned(
                top: 35,
                right: 20,
                child: InkWell(
                  onTap: () {
                    expandablesheet.currentState!.contract();
                  },
                  child: SvgPicture.asset(
                      "assets/images/svg/button-button-close-round.svg"),
                )),
          ]),
          const SizedBox(
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
                    Text(
                      searchModel.name!,
                      style: const TextStyle(
                          fontFamily: "OpenSans-Bold", fontSize: 14),
                    ),
                    Row(
                      children: [
                        Text(
                          searchModel.etablissement!.moyenne.toString(),
                          style: const TextStyle(
                              fontFamily: "OpenSans-Bold", fontSize: 12),
                        ),
                        RatingBar.builder(
                          ignoreGestures: true,
                          itemSize: 12,
                          initialRating: double.parse(
                              searchModel.etablissement!.moyenne.toString()),
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
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
                              "${searchModel.etablissement!.avis!} ",
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
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              searchModel.type! == "nominatim"
                  ? const SizedBox()
                  : buttonBottomSheetNoLabel(
                      S.of(context).contacter,
                      "assets/images/svg/icon-action-vignette-appeler.svg",
                      primaryColor,
                      null),
              buttonBottomSheetNoLabel(
                  S.of(context).routing,
                  "assets/images/svg/icon-action-vignette-itinéraire.svg",
                  whiteColor, () {
                mapBloc.add(AddRoutingInMap(
                    searchModel.longitude, searchModel.latitude));
                expandablesheet.currentState!.contract();
              }),
              buttonBottomSheetNoLabel(
                  S.of(context).share,
                  "assets/images/svg/icon-action-vignette-partager.svg",
                  whiteColor,
                  null),
              searchModel.type! == "nominatim"
                  ? const SizedBox()
                  : searchModel.etablissement!.isFavoris!
                      ? buttonBottomSheetNoLabel(
                          S.of(context).saved,
                          "assets/images/svg/icon-action-vignette-remove.svg",
                          primaryColor,
                          null)
                      : buttonBottomSheetNoLabel(
                          S.of(context).save,
                          "assets/images/svg/icon-action-vignette-enregistrer.svg",
                          whiteColor,
                          null),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            color: grey3,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).commodite,
                  style: const TextStyle(
                      color: greyColor, fontFamily: "OpenSans-Bold"),
                ),
                SvgPicture.asset("assets/images/svg/icon-map-arrow-right.svg")
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: buildCommodites(searchModel.etablissement!.commodites!),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            color: grey3,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).services,
                  style: const TextStyle(
                      color: greyColor, fontFamily: "OpenSans-Bold"),
                ),
                SvgPicture.asset("assets/images/svg/icon-map-arrow-right.svg")
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              searchModel.etablissement!.services!.replaceAll(";", " • "),
              style: const TextStyle(fontFamily: "OpenSans", color: greyColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            color: grey3,
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                SvgPicture.asset("assets/images/svg/icon-time.svg"),
                const SizedBox(
                  width: 5,
                ),
                searchModel.isOpenNow!
                    ? Text(
                        S.of(context).opennow,
                        style: const TextStyle(
                            fontFamily: "OpenSans",
                            color: greyColor,
                            fontSize: 12),
                      )
                    : Text(
                        S.of(context).close,
                        style: const TextStyle(
                            fontFamily: "OpenSans",
                            color: greyColor,
                            fontSize: 12),
                      ),
                Text(
                  searchModel.plageDay!,
                  style: const TextStyle(
                      fontFamily: "OpenSans", color: greyColor, fontSize: 12),
                ),
                const SizedBox(
                  width: 5,
                ),
                SvgPicture.asset("assets/images/svg/icon-icon-see-more.svg"),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Visibility(
            visible: isVisible,
            child: Container(
              margin: const EdgeInsets.only(left: 50, right: 50),
              child: Column(
                children: buildHoraires(searchModel.etablissement!.horaires!),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                SvgPicture.asset("assets/images/svg/icon-place.svg"),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Text(
                    "${searchModel.etablissement!.batiment!.rue!} ${searchModel.etablissement!.batiment!.quartier! == "Non Defini" ? "" : searchModel.etablissement!.batiment!.quartier!} ${searchModel.etablissement!.batiment!.ville!} ${searchModel.etablissement!.batiment!.indication ?? ""} ${searchModel.etablissement!.codePostal == "null" ? "" : searchModel.etablissement!.codePostal}",
                    style: const TextStyle(
                        fontFamily: "OpenSans", color: greyColor, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                SvgPicture.asset("assets/images/svg/icon-web.svg"),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Text(
                    searchModel.etablissement!.siteInternet == "null"
                        ? S.of(context).nowebsite
                        : searchModel.etablissement!.siteInternet!,
                    style: const TextStyle(
                        fontFamily: "OpenSans", color: greyColor, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            color: grey3,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.topLeft,
            child: Text(
              S.of(context).presentation,
              style: const TextStyle(
                  color: greyColor, fontFamily: "OpenSans-Bold"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              searchModel.etablissement!.description!,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontFamily: "OpenSans", color: greyColor, fontSize: 12),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            color: grey3,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              S.of(context).avis,
              style: const TextStyle(
                  color: greyColor, fontFamily: "OpenSans-Bold"),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          etablissementReview(
              S.of(context).newreview,
              S.of(context).avis,
              S.of(context).latestreview,
              searchModel,
              double.parse(searchModel.etablissement!.avis.toString())),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            color: grey3,
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children:
                buildCommentaires(searchModel.etablissement!.commentaires!),
          ),
          Text(
            S.of(context).showmorereviews,
            style: const TextStyle(
                fontFamily: "OpenSans-Bold", color: primaryColor, fontSize: 14),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ),
  );
}

List<Widget> buildCommentaires(List<Commentaire> comentaires) {
  List<Widget> items = [];
  for (var i = 0; i < comentaires.length; i++) {
    Widget item = etablissementComment(comentaires[i]);
    items.add(item);
  }
  return items;
}

List<Widget> buildHoraires(List<Horaire> horaires) {
  List<Widget> items = [];
  for (var i = 0; i < horaires.length; i++) {
    Widget item = Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              horaires[i].jour!,
              style: const TextStyle(
                  color: greyColor, fontFamily: "OpenSans", fontSize: 13),
            ),
            const SizedBox(
              width: 50,
            ),
            Text(
              horaires[i].plageHoraire!,
              style: const TextStyle(
                  color: greyColor, fontFamily: "OpenSans", fontSize: 13),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        )
      ],
    );

    items.add(item);
  }
  return items;
}
