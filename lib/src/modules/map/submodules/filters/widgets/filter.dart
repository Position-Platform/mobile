import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/modules/map/blocs/map/map_bloc.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/commodites_model/commodite.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/type_commodites_model/types_commodite.dart';
import 'package:position/src/modules/map/submodules/filters/views/filterpage.dart';
import 'package:position/src/modules/map/submodules/filters/widgets/filterchips.dart';

Widget filterContainer(BuildContext context,
    List<TypesCommodite> typeCommodites, MapBloc mapbloc) {
  List<Commodite> commodites = [];
  return BlocBuilder<MapBloc, MapState>(builder: (context, state) {
    if (state is SelectedChips) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 10,
          margin: EdgeInsets.zero,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return FiltersPage(
                            typesCommodites: typeCommodites,
                            mapbloc: mapbloc,
                            commoditeSelected: state.commoditesSelected,
                          );
                        },
                      ),
                    );
                  },
                  child: Chip(
                    labelPadding: const EdgeInsets.all(1.0),
                    shape: const StadiumBorder(
                        side: BorderSide(
                      color: grey2,
                    )),
                    avatar: CircleAvatar(
                      backgroundColor: transparent,
                      child: SvgPicture.asset(
                        "assets/images/svg/icon-filters.svg",
                        height: 15,
                        width: 15,
                      ),
                    ),
                    label: state.commoditesSelected!.isNotEmpty
                        ? state.commoditesSelected!.length > 1
                            ? Text(
                                "${state.commoditesSelected!.length} ${S.of(context).filters}",
                                style: const TextStyle(
                                    color: blackColor,
                                    fontFamily: "OpenSans-Bold",
                                    fontSize: 11),
                              )
                            : Text(
                                "${state.commoditesSelected!.length} ${S.of(context).filtre}",
                                style: const TextStyle(
                                    color: blackColor,
                                    fontFamily: "OpenSans-Bold",
                                    fontSize: 11),
                              )
                        : Text(
                            S.of(context).filters,
                            style: const TextStyle(
                                color: blackColor,
                                fontFamily: "OpenSans-Bold",
                                fontSize: 11),
                          ),
                    backgroundColor: whiteColor,
                    elevation: 0.0,
                    shadowColor: transparent,
                    padding: const EdgeInsets.all(6.0),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Wrap(
                  spacing: 6.0,
                  runSpacing: 6.0,
                  children: buildCommodites(state.commoditesSelected!, mapbloc),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 10,
        margin: EdgeInsets.zero,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FiltersPage(
                          typesCommodites: typeCommodites,
                          mapbloc: mapbloc,
                          commoditeSelected: const [],
                        );
                      },
                    ),
                  );
                },
                child: Chip(
                  labelPadding: const EdgeInsets.all(1.0),
                  shape: const StadiumBorder(
                      side: BorderSide(
                    color: grey2,
                  )),
                  avatar: CircleAvatar(
                    backgroundColor: transparent,
                    child: SvgPicture.asset(
                      "assets/images/svg/icon-filters.svg",
                      height: 15,
                      width: 15,
                    ),
                  ),
                  label: commodites
                          .where((element) => element.isSelected)
                          .isNotEmpty
                      ? commodites
                                  .where((element) => element.isSelected)
                                  .length >
                              1
                          ? Text(
                              "${commodites.where((element) => element.isSelected).length} ${S.of(context).filters}",
                              style: const TextStyle(
                                  color: blackColor,
                                  fontFamily: "OpenSans-Bold",
                                  fontSize: 11),
                            )
                          : Text(
                              "${commodites.where((element) => element.isSelected).length} ${S.of(context).filtre}",
                              style: const TextStyle(
                                  color: blackColor,
                                  fontFamily: "OpenSans-Bold",
                                  fontSize: 11),
                            )
                      : Text(
                          S.of(context).filters,
                          style: const TextStyle(
                              color: blackColor,
                              fontFamily: "OpenSans-Bold",
                              fontSize: 11),
                        ),
                  backgroundColor: whiteColor,
                  elevation: 0.0,
                  shadowColor: transparent,
                  padding: const EdgeInsets.all(6.0),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Wrap(
                spacing: 6.0,
                runSpacing: 6.0,
                children: buildCommodites(commodites, mapbloc),
              ),
            ],
          ),
        ),
      ),
    );
  });
}

List<Widget> buildCommodites(List<Commodite> commodites, MapBloc mapBloc) {
  List<Widget> items = [];
  for (var i = 0; i < commodites.length; i++) {
    Widget item = filterChip(commodites[i], mapBloc);
    items.add(item);
  }
  return items;
}
