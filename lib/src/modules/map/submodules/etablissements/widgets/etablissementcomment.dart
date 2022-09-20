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
                    "https://lh3.googleusercontent.com/EvLrgTmPxI7PolPNdlGB99kLymh8LspsxHhhe-qHsoX4QqYIUjra4G_fAoSXM0nQSQGkOTGPFSJHymyYgcSox-oUMWkrOAEfhAnnFEHNbPzUKRXKvLAxg52iVyJnaTL5dVe9EfsdRDpNVAhj6QqUfT-XfKtm_k1_i3xHlkN-H-PMQupnoZ-_V3K-NKXSNvpHewebGWWhGHWq-vTxuyHPyiWJe1VPXXo47uLqybMgPeHXi85U0BFFJKn3_39fXdN9FIQ8isYomRANLGXQc6TvyNy8WKUBdAWtC48E2yzyGFP7y3PnbgnoYLZE32HHE0XN8XaZI3-9rjszXXuHE1UCG8swRFh7G4wtHuahQGg_sNxDYriRTOwZ4pylWZ0ydu9bRbpnO7c64QIIZge42T7SqCB86J6SK8CJGoEYL1rSGW2APc6Muoa7M0mshdI81R40CFjYi9z6JYnifaYa6K0IjOHBk-l_Y2RRnvS-bdIn-TpDLNs_XzftdyLT5KvCq5Ww4dyfApj6NGbaqAC5CUnYz1G0Vgo_LZ6WhckvyiS68sltf97YuNdWVRgTjLphz3YoeiDcHftMbO0cuR5SnKy2XH2IokgmRcipVqDjImilHUrB_mz4U7uyZq3mLbncqgKf3AKbxjHpJJUmbWy7Vwy_o-g06dyH6u7AVgrxKO41JzlyHnltJKA09NCK5KRKUaY-MN-DJba-MuQd3o810qrqbqzjTheI9qRvKyPqumHFQgTF1InrYmwr4mSHNfXaCHuweksc2CIAFGma13mYRvSfl6izboWtRdG9HTkGZcrYkj_bOq85Pm1DaaFvYDAnN2vq4KtQ9kxzAQ=w620-h625-no?authuser=0",
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
