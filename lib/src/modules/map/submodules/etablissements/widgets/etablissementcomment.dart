import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:position/src/core/utils/colors.dart';

Widget etablissementComment() {
  return Container(
    margin: const EdgeInsets.only(left: 20, right: 40),
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
                    "https://sessionize.com/image/721c-400o400o2-SdV7M2MzJoyhWRfxhezGtj.jpg",
                    height: 30,
                    width: 30,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Mical Annette',
                      style: TextStyle(
                          fontFamily: "OpenSans-Bold",
                          fontSize: 14,
                          color: greyColor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('3 Semaines',
                        style: TextStyle(
                            color: greyColor,
                            fontSize: 12,
                            fontFamily: "OpenSans")),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: RatingBar.builder(
                itemSize: 12,
                initialRating: 3.9,
                minRating: 1,
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
          margin: const EdgeInsets.only(right: 10),
          child: const Flexible(
              child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
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
      ],
    ),
  );
}
