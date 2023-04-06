import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/sizes.dart';
import 'package:position/src/core/utils/tools.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/modules/map/blocs/map/map_bloc.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/category.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/etablissements.dart';
import 'package:position/src/modules/map/submodules/etablissements/views/etablissementslistpage.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage(
      {super.key,
      @required this.mapbloc,
      @required this.category,
      @required this.user});
  final MapBloc? mapbloc;

  final Category? category;
  final User? user;

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool distanceSelected = true;
  bool avisSelected = false;
  bool pertinanceSelected = false;

  List<String>? commoditesSelected = [];

  @override
  Widget build(BuildContext context) {
    changeStatusColor(whiteColor);
    return Scaffold(
      body: BlocListener<MapBloc, MapState>(
        listener: (context, state) {
          if (state is DistanceSelected) {
            distanceSelected = true;
            avisSelected = false;
            pertinanceSelected = false;
          }
          if (state is AvisSelected) {
            distanceSelected = false;
            avisSelected = true;
            pertinanceSelected = false;
          }
          if (state is PertinenceSelected) {
            distanceSelected = false;
            avisSelected = false;
            pertinanceSelected = true;
          }
        },
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return SingleChildScrollView(
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
                      InkWell(
                          highlightColor: transparent,
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                              "assets/images/svg/icon-clear.svg"))
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
                      InkWell(
                        highlightColor: transparent,
                        onTap: () {
                          widget.mapbloc?.add(DistanceSelect());
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 90,
                          height: 26,
                          decoration: BoxDecoration(
                              color:
                                  distanceSelected ? primaryColor : transparent,
                              border: Border.all(color: grey2),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(13),
                                  bottomLeft: Radius.circular(13))),
                          child: Text(S.of(context).distance,
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                color:
                                    distanceSelected ? whiteColor : greyColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                      ),
                      InkWell(
                        highlightColor: transparent,
                        onTap: () {
                          widget.mapbloc?.add(AvisSelect());
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 90,
                          height: 26,
                          decoration: BoxDecoration(
                              color: avisSelected ? primaryColor : transparent,
                              border: Border.all(color: grey2)),
                          child: Text(S.of(context).avis,
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                color: avisSelected ? whiteColor : greyColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                      ),
                      InkWell(
                        highlightColor: transparent,
                        onTap: () {
                          widget.mapbloc?.add(PertinenceSelect());
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 90,
                          height: 26,
                          decoration: BoxDecoration(
                              color: pertinanceSelected
                                  ? primaryColor
                                  : transparent,
                              border: Border.all(color: grey2),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(13),
                                  bottomRight: Radius.circular(13))),
                          child: Text(S.of(context).pertinence,
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                color:
                                    pertinanceSelected ? whiteColor : greyColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
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
                  Column(
                      // Build List Commodites
                      )
                ],
              ),
            );
          },
        ),
      ),
      bottomSheet: BlocBuilder<MapBloc, MapState>(builder: (context, state) {
        if (state is SelectedChips) {
          return Container(
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
                    InkWell(
                      highlightColor: transparent,
                      onTap: () {
                        widget.mapbloc?.add(CategorieClick(widget.category));
                        Navigator.pop(context);
                      },
                      child: Text(S.of(context).cancel,
                          style: TextStyle(
                            fontFamily: 'OpenSans-Bold',
                            color: primaryColor,
                            fontSize: textSize,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                    InkWell(
                      highlightColor: transparent,
                      onTap: () {},
                      child: Container(
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
                          )),
                    )
                  ],
                )
              ],
            ),
          );
        }
        return Container(
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
                  InkWell(
                    highlightColor: transparent,
                    onTap: () {
                      widget.mapbloc?.add(CategorieClick(widget.category));
                      Navigator.pop(context);
                    },
                    child: Text(S.of(context).cancel,
                        style: TextStyle(
                          fontFamily: 'OpenSans-Bold',
                          color: primaryColor,
                          fontSize: textSize,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                  InkWell(
                    highlightColor: transparent,
                    onTap: () {
                      List<String> commodites = [];
                      for (var i = 0; i < commoditesSelected!.length; i++) {
                        commodites.add(commoditesSelected![i]);
                      }
                      String commoditeSend = commodites.join(",");

                      widget.mapbloc!.add(SearchEtablissementByFilter(
                          widget.category,
                          widget.user,
                          commoditeSend,
                          distanceSelected,
                          avisSelected,
                          pertinanceSelected));

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return EtablissementListPage(
                              initialLink: null,
                              mapBloc: widget.mapbloc,
                              category: widget.category,
                              user: widget.user,
                              etablissements: Etablissements(data: []),
                              avis: avisSelected,
                              distance: distanceSelected,
                              commodites: commoditeSend,
                              pertinance: pertinanceSelected,
                              page: null,
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
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
                        )),
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
