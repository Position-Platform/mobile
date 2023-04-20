// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/configs.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/datum.dart';

Widget etablissementCard(
    BuildContext context, Datum etablissement, void Function()? onTap) {
  return InkWell(
    highlightColor: transparent,
    onTap: onTap,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
      ),
      elevation: 20,
      child: SizedBox(
        width: 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 100,
              color: whiteColor,
              child: Row(
                children: <Widget>[
                  Container(
                    color: transparent,
                    width: 130,
                    height: 100,
                    child: CachedNetworkImage(
                      imageUrl: apiUrl + etablissement.cover!,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) {
                        return Image.asset("assets/images/png/notfound.png");
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 150,
                    margin: const EdgeInsets.only(top: 20, left: 10),
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  etablissement.nom!,
                                  style: const TextStyle(
                                      fontFamily: "OpenSans-Bold",
                                      fontSize: 11),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(etablissement.sousCategories![0].nom!,
                                  style: const TextStyle(
                                      color: greyColor,
                                      fontSize: 10,
                                      fontFamily: "OpenSans")),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    etablissement.moyenne.toString(),
                                    style: const TextStyle(
                                        fontFamily: "OpenSans-Bold",
                                        fontSize: 10),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  RatingBar.builder(
                                    itemSize: 8,
                                    initialRating: double.parse(
                                        etablissement.moyenne.toString()),
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
                                    onRatingUpdate: (rating) {},
                                  ),
                                  const SizedBox(
                                    width: 60,
                                  ),
                                  Text(
                                    "Environ ${etablissement.distance} km",
                                    style: const TextStyle(
                                        fontFamily: "OpenSans", fontSize: 9),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
