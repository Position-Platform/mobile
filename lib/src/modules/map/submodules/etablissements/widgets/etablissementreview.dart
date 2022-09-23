import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/sizes.dart';
import 'package:position/src/modules/map/models/search_model/search_model.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/count.dart';

Widget etablissementReview(String label, String labelavis, String labelreview,
    SearchModel searchModel, double avis) {
  return Container(
    margin: const EdgeInsets.only(left: 20, right: 60),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: buildRatings(searchModel.etablissement!.count!, avis),
            ),
            Column(
              children: [
                Text(
                  searchModel.etablissement!.moyenne.toString(),
                  style: const TextStyle(
                      fontFamily: "OpenSans-Bold", fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                RatingBar.builder(
                  itemSize: 14,
                  initialRating: double.parse(
                      searchModel.etablissement!.moyenne.toString()),
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
                    //  print(rating);
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "${searchModel.etablissement!.avis!} ",
                      style:
                          const TextStyle(fontFamily: "OpenSans", fontSize: 14),
                    ),
                    Text(
                      labelavis,
                      style:
                          const TextStyle(fontFamily: "OpenSans", fontSize: 14),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
            width: 130,
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
              child: Text(label,
                  style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: whiteColor,
                    fontSize: textSize,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            )),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              labelreview,
              style: const TextStyle(fontFamily: "OpenSans"),
            ),
            const SizedBox(
              width: 5,
            ),
            SvgPicture.asset("assets/images/svg/icon-icon-see-more.svg")
          ],
        )
      ],
    ),
  );
}

List<Widget> buildRatings(List<Count> counts, double avis) {
  List<Widget> items = [];
  for (var i = 0; i < counts.length; i++) {
    Widget item = Row(
      children: [
        Text(
          counts[i].rating.toString(),
          style: const TextStyle(fontFamily: "OpenSans", color: greyColor),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 160,
          height: 5,
          child: LinearProgressIndicator(
            value: double.parse(counts[i].count.toString()) / avis,
            color: accentColor,
            backgroundColor: grey2,
          ),
        ),
      ],
    );
    items.add(item);
  }
  return items;
}
