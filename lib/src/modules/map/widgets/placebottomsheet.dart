import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/modules/map/widgets/bottomSheetButton.dart';

Widget placeBottomSheet(BuildContext context) {
  return Container(
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
                  const Text(
                    'TonGou Hotel',
                    style: TextStyle(fontFamily: "OpenSans-Bold", fontSize: 14),
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
                      const Text(
                        "212 avis",
                        style: TextStyle(fontFamily: "OpenSans", fontSize: 11),
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
                      color: greyColor, fontSize: 12, fontFamily: "OpenSans")),
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
                  SvgPicture.asset("assets/images/svg/icon-service-check.svg"),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    "Ouvert jusqu'a 19h",
                    style: TextStyle(fontFamily: "OpenSans", fontSize: 11),
                  )
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/images/svg/icon-service-check.svg"),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    "Paiment mobile",
                    style: TextStyle(fontFamily: "OpenSans", fontSize: 11),
                  )
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/images/svg/icon-service-check.svg"),
                  const SizedBox(
                    width: 3,
                  ),
                  const Text(
                    "espèce",
                    style: TextStyle(fontFamily: "OpenSans", fontSize: 11),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              buttonBottomSheet(
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
              buttonBottomSheet(
                  S.of(context).save,
                  "assets/images/svg/icon-action-vignette-enregistrer.svg",
                  whiteColor,
                  primaryColor),
            ],
          ),
        )
      ],
    ),
  );
}
