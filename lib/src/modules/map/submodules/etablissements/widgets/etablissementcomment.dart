import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/configs.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/commentaire.dart';

Widget etablissementComment(Commentaire commentaire) {
  return Container(
    margin: const EdgeInsets.only(left: 20, right: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: grey2),
                    borderRadius: const BorderRadius.all(Radius.circular(5.0) //
                        ),
                  ),
                  child: Image.network(
                    commentaire.user!.imageProfil!.contains("http")
                        ? commentaire.user!.imageProfil!
                        : apiUrl + commentaire.user!.imageProfil!,
                    height: 30,
                    width: 30,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      commentaire.user!.name!,
                      style: const TextStyle(
                          fontFamily: "OpenSans-Bold",
                          fontSize: 14,
                          color: greyColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(commentaire.createdAt!.toLocal().toString(),
                        style: const TextStyle(
                            color: greyColor,
                            fontSize: 11,
                            fontFamily: "OpenSans")),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: RatingBar.builder(
                ignoreGestures: true,
                itemSize: 12,
                initialRating: double.parse(commentaire.rating.toString()),
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: accentColor,
                ),
                onRatingUpdate: (rating) {
                  // print(rating);
                },
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(right: 10),
          child: Flexible(
              child: Text(
            commentaire.commentaire!,
            style: const TextStyle(fontFamily: "OpenSans", color: greyColor),
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
      ],
    ),
  );
}
