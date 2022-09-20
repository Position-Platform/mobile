import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/sizes.dart';
import 'package:position/src/core/utils/tools.dart';
import 'package:position/src/modules/map/submodules/filters/widgets/filterchips.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({super.key});

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(whiteColor);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 32.0),
                Text(
                  S.of(context).filters,
                  style: const TextStyle(
                      fontFamily: "OpenSans-Bold", fontSize: 16),
                ),
                SvgPicture.asset("assets/images/svg/icon-clear.svg")
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: grey3,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 20),
              child: Text(S.of(context).trier,
                  style: const TextStyle(
                    fontFamily: 'OpenSans',
                    color: greyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 90,
                  height: 26,
                  decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(13),
                          bottomLeft: Radius.circular(13))),
                  child: Text(S.of(context).distance,
                      style: const TextStyle(
                        fontFamily: 'OpenSans',
                        color: whiteColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 90,
                  height: 26,
                  decoration: BoxDecoration(border: Border.all(color: grey2)),
                  child: Text(S.of(context).avis,
                      style: const TextStyle(
                        fontFamily: 'OpenSans',
                        color: greyColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 90,
                  height: 26,
                  decoration: BoxDecoration(
                      border: Border.all(color: grey2),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(13),
                          bottomRight: Radius.circular(13))),
                  child: Text(S.of(context).pertinence,
                      style: const TextStyle(
                        fontFamily: 'OpenSans',
                        color: greyColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
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
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 20),
              child: const Text("Accessibilité",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    color: greyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 20),
              child: Wrap(
                spacing: 6.0,
                runSpacing: 6.0,
                children: <Widget>[
                  filterChip('Ouvert', false),
                  filterChip('Hotels', false),
                  filterChip('Agences de voyage', false),
                  filterChip('Sports', false),
                  filterChip('Nature', false),
                  filterChip('Agences de voyage', false),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 20),
              child: const Text("Paiements et Facilités",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    color: greyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 20),
              child: Wrap(
                spacing: 6.0,
                runSpacing: 6.0,
                children: <Widget>[
                  filterChip('Ouvert', false),
                  filterChip('Hotels', false),
                  filterChip('Agences de voyage', false),
                  filterChip('Sports', false),
                  filterChip('Nature', false),
                  filterChip('Agences de voyage', false),
                  filterChip('Sports', false),
                  filterChip('Nature', false),
                  filterChip('Agences de voyage', false),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 20),
              child: const Text("Equipements",
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    color: greyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 20),
              child: Wrap(
                spacing: 6.0,
                runSpacing: 6.0,
                children: <Widget>[
                  filterChip('Ouvert', false),
                  filterChip('Hotels', false),
                  filterChip('Agences de voyage', false),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        margin: const EdgeInsets.only(right: 10),
        height: 100,
        child: Column(
          children: [
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(S.of(context).cancel,
                    style: TextStyle(
                      fontFamily: 'OpenSans-Bold',
                      color: primaryColor,
                      fontSize: textSize,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    )),
                Container(
                    width: 130,
                    height: 35,
                    margin: const EdgeInsets.only(left: 50),
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
                      child: Text(S.of(context).valider,
                          style: TextStyle(
                            fontFamily: 'OpenSans-Bold',
                            color: whiteColor,
                            fontSize: textSize,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
