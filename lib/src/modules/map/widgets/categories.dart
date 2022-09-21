import 'package:flutter/material.dart';
import 'package:position/src/modules/map/blocs/map/map_bloc.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/category.dart';
import 'package:position/src/modules/map/widgets/chips.dart';
import 'package:position/src/modules/map/widgets/expanded.dart';

List<Widget> generateCategoryWidget(
    List<Category> categories, MapBloc? mapBloc, bool isExpanded) {
  List<Widget> items = [];
  List<Widget> items2 = [];

  for (int i = 0; i < categories.length; i++) {
    if (i < 4) {
      items.add(Container(
        margin: const EdgeInsets.only(left: 10),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10.0,
          runSpacing: 1.0,
          children: [
            buildChip(categories[i].shortname!, categories[i].logourl!, () {
              Category category = categories[i];
              category.vues = categories[i].vues! + 1;
              mapBloc?.add(CategorieClick(category));
            })
          ],
        ),
      ));
    } else {
      items2
          .add(buildChip(categories[i].shortname!, categories[i].logourl!, () {
        Category category = categories[i];
        category.vues = categories[i].vues! + 1;
        mapBloc?.add(CategorieClick(category));
      }));
    }
  }
  items.add(ExpandedSection(
    expand: isExpanded,
    child: Container(
      margin: const EdgeInsets.only(left: 10),
      child: Wrap(
        spacing: 10.0,
        runSpacing: 1.0,
        children: items2,
      ),
    ),
  ));

  return items;
}
