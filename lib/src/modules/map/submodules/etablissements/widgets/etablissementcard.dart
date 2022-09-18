// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:position/src/core/utils/colors.dart';

Widget etablissementCard() {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
    ),
    elevation: 5,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 100,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                color: transparent,
                width: 130,
                height: 100,
                child: Image.network(
                  "https://st2.depositphotos.com/1258191/6689/i/450/depositphotos_66890813-stock-photo-online-shopping-website.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 20),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'TonGou Hotel',
                        style: TextStyle(
                            fontFamily: "OpenSans-Bold", fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('Test Video',
                          style: TextStyle(
                              color: greyColor,
                              fontSize: 12,
                              fontFamily: "OpenSans")),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            "3,9",
                            style: TextStyle(
                                fontFamily: "OpenSans-Bold", fontSize: 12),
                          ),
                          const SizedBox(
                            width: 4,
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
                              print(rating);
                            },
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          const Text(
                            "Environ 1,2km",
                            style:
                                TextStyle(fontFamily: "OpenSans", fontSize: 11),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
