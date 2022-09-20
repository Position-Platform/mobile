import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/tools.dart';
import 'package:position/src/modules/map/submodules/etablissements/widgets/etablissementcomment.dart';
import 'package:position/src/modules/map/submodules/etablissements/widgets/etablissementreview.dart';
import 'package:position/src/modules/map/widgets/bottomSheetButtonNoLabel.dart';
import 'package:position/src/modules/map/widgets/headerbottomSheet.dart';

class EtablissementPage extends StatelessWidget {
  const EtablissementPage({super.key});

  @override
  Widget build(BuildContext context) {
    changeStatusColor(whiteColor);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CarouselSlider(
                      items: imgList
                          .map((item) => Container(
                              alignment: Alignment.topLeft,
                              child: Image.network(
                                item,
                                fit: BoxFit.cover,
                                width: 160,
                                height: 150,
                              )))
                          .toList(),
                      options: CarouselOptions(
                        height: 150,
                        enableInfiniteScroll: true,
                        scrollDirection: Axis.horizontal,
                        viewportFraction: 0.3,
                      )),
                  Positioned(
                    right: 10.0,
                    top: 10.0,
                    child: SvgPicture.asset(
                        "assets/images/svg/button-button-close-round.svg"),
                  )
                ],
              ),
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
                        const Text(
                          'TonGou Hotel',
                          style: TextStyle(
                              fontFamily: "OpenSans-Bold", fontSize: 14),
                        ),
                        Row(
                          children: [
                            const Text(
                              "3,9",
                              style: TextStyle(
                                  fontFamily: "OpenSans-Bold", fontSize: 12),
                            ),
                            RatingBar.builder(
                              itemSize: 12,
                              initialRating: 3.9,
                              minRating: 1,
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
                                const Text(
                                  "212 ",
                                  style: TextStyle(
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
                    const Text('Test Video',
                        style: TextStyle(
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
                  buttonBottomSheetNoLabel(
                    S.of(context).contacter,
                    "assets/images/svg/icon-action-vignette-appeler.svg",
                    primaryColor,
                  ),
                  buttonBottomSheetNoLabel(
                    S.of(context).routing,
                    "assets/images/svg/icon-action-vignette-itinéraire.svg",
                    whiteColor,
                  ),
                  buttonBottomSheetNoLabel(
                    S.of(context).share,
                    "assets/images/svg/icon-action-vignette-partager.svg",
                    whiteColor,
                  ),
                  buttonBottomSheetNoLabel(
                    S.of(context).save,
                    "assets/images/svg/icon-action-vignette-enregistrer.svg",
                    whiteColor,
                  ),
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
                    SvgPicture.asset(
                        "assets/images/svg/icon-map-arrow-right.svg")
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
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                            "assets/images/svg/icon-service-check.svg"),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          "Ouvert jusqu'a 19h",
                          style:
                              TextStyle(fontFamily: "OpenSans", fontSize: 12),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                            "assets/images/svg/icon-service-check.svg"),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          "Paiment mobile",
                          style:
                              TextStyle(fontFamily: "OpenSans", fontSize: 12),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                            "assets/images/svg/icon-service-check.svg"),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          "espèce",
                          style:
                              TextStyle(fontFamily: "OpenSans", fontSize: 12),
                        )
                      ],
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).services,
                      style: const TextStyle(
                          color: greyColor, fontFamily: "OpenSans-Bold"),
                    ),
                    SvgPicture.asset(
                        "assets/images/svg/icon-map-arrow-right.svg")
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: const Text(
                  "restaurant • bar • terrasse • piscine • spa • accueil 24h/24…",
                  style: TextStyle(fontFamily: "OpenSans", color: greyColor),
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
                    Text(
                      S.of(context).opennow,
                      style: const TextStyle(
                          fontFamily: "OpenSans", color: greyColor),
                    ),
                    const Text(
                      "08:30 - 19:00",
                      style:
                          TextStyle(fontFamily: "OpenSans", color: greyColor),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(
                        "assets/images/svg/icon-icon-see-more.svg"),
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
                    SvgPicture.asset("assets/images/svg/icon-place.svg"),
                    const SizedBox(
                      width: 5,
                    ),
                    const Flexible(
                      child: Text(
                        "Rue de Mélen, face polytech et à côté de l'hôtel « La Résidence », BP 14410 YAOUNDÉ, Cameroun",
                        style:
                            TextStyle(fontFamily: "OpenSans", color: greyColor),
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
                    const Flexible(
                      child: Text(
                        "www.monhotel.com",
                        style:
                            TextStyle(fontFamily: "OpenSans", color: greyColor),
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
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: const Flexible(
                    child: Text(
                  "Les chambres standards et colorées disposent du Wi-Fi gratuit, d'une télévision à écran plat et d'une salle de bain commune. Certaines sont dotées de lits superposés. Celles de catégorie supérieure sont pourvues d'une salle de bain attenante. Le parking est inclus. L'établissement possède un espace repas branché. Le petit-déjeuner est payant, et les animaux de compagnie sont acceptés moyennant un supplément.",
                  style: TextStyle(fontFamily: "OpenSans", color: greyColor),
                )),
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
              etablissementReview(S.of(context).newreview, S.of(context).avis,
                  S.of(context).latestreview),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                color: grey3,
              ),
              const SizedBox(
                height: 10,
              ),
              etablissementComment(),
              etablissementComment(),
              etablissementComment(),
              etablissementComment(),
              Text(
                S.of(context).showmorereviews,
                style: const TextStyle(
                    fontFamily: "OpenSans-Bold",
                    color: primaryColor,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
