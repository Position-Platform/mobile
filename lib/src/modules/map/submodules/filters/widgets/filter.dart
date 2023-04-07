import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/modules/map/blocs/map/map_bloc.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/category.dart';
import 'package:position/src/modules/map/submodules/filters/views/filterpage.dart';

Widget filterContainer(BuildContext context, MapBloc mapbloc, Category category,
    User user, String commodites) {
  List<String> commoditesList = commodites.split(";");
  if (commoditesList[0] == "") {
    commoditesList.clear();
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
              highlightColor: transparent,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FiltersPage(
                        mapbloc: mapbloc,
                        category: category,
                        user: user,
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
                label: commoditesList.isNotEmpty
                    ? commoditesList.length > 1
                        ? Text(
                            "${commoditesList.length} ${S.of(context).filters}",
                            style: const TextStyle(
                                color: blackColor,
                                fontFamily: "OpenSans-Bold",
                                fontSize: 11),
                          )
                        : Text(
                            "${commoditesList.length} ${S.of(context).filtre}",
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
              children: buildCommodites(commoditesList, mapbloc),
            ),
          ],
        ),
      ),
    ),
  );
}

List<Widget> buildCommodites(List<String> commodites, MapBloc mapBloc) {
  List<Widget> items = [];
  for (var i = 0; i < commodites.length; i++) {
    Widget item = ChoiceChip(
      selected: true,
      selectedColor: primaryColor,
      disabledColor: transparent,
      labelPadding: const EdgeInsets.all(1.0),
      shape: const StadiumBorder(
          side: BorderSide(
        color: grey2,
      )),
      labelStyle: const TextStyle(
          color: whiteColor, fontSize: 12, fontFamily: "OpenSans-Bold"),
      label: Text(
        commodites[i],
      ),
      backgroundColor: whiteColor,
      elevation: 0.0,
      shadowColor: transparent,
      padding: const EdgeInsets.all(6.0),
      onSelected: (value) {},
    );
    items.add(item);
  }
  return items;
}
