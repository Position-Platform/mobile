import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/modules/map/blocs/map/map_bloc.dart';
import 'package:position/src/modules/map/models/search_model/search_model.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/count.dart';
import 'package:rating_dialog/rating_dialog.dart';

Widget etablissementReview(
    BuildContext context,
    MapBloc mapBloc,
    String label,
    String labelavis,
    String labelreview,
    SearchModel searchModel,
    double avis,
    bool isReview) {
  final dialog = RatingDialog(
    initialRating: 0.0,
    starColor: accentColor,
    starSize: 25,
    // your app's name?
    title: Text(
      searchModel.etablissement!.nom!,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    // encourage your user to leave a high rating?
    message: Text(
      S.of(context).commentdesc,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 12),
    ),
    // your app's logo?
    image: Image.asset(
      "assets/images/png/logo-nom.png",
      height: 35,
      width: 35,
    ),
    submitButtonText: S.of(context).valider,
    commentHint: S.of(context).commenthint,
    onCancelled: () {},
    onSubmitted: (response) {
      mapBloc.add(AddReview(searchModel.etablissement!.id!, response.comment,
          response.rating.toInt()));
    },
  );
  return Container(
    margin: const EdgeInsets.only(left: 20, right: 20),
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
                  ignoreGestures: true,
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
        InkWell(
          highlightColor: transparent,
          onTap: () {
            isReview
                ? null
                : showDialog(
                    context: context,
                    barrierDismissible:
                        true, // set to false if you want to force a rating
                    builder: (context) => dialog,
                  );
          },
          child: Container(
              width: 100,
              height: 35,
              decoration: BoxDecoration(
                color: isReview ? grey97 : primaryColor,
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
                    style: const TextStyle(
                      fontFamily: 'OpenSans-Bold',
                      color: whiteColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              labelreview,
              style: const TextStyle(
                  fontFamily: "OpenSans", color: greyColor, fontSize: 12),
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
