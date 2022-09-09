import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/modules/map/widgets/searchItem.dart';

class CustomSearchDelegate extends SearchDelegate {
  final String? hintText;
  CustomSearchDelegate({this.hintText});
  // Demo list to show querying
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries"
  ];

  @override
  String? get searchFieldLabel => hintText;

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: SvgPicture.asset(
          "assets/images/svg/icon-clear.svg",
        ),
      ),
      const VerticalDivider(
        color: grey3,
      ),
      Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 10),
        height: 20,
        width: 40,
        child: SvgPicture.asset("assets/images/svg/icon-perm_identity.svg"),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: SvgPicture.asset(
        "assets/images/svg/icon-arrow_left.svg",
      ),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        //  var result = matchQuery[index];
        return searchItem();
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        //  var result = matchQuery[index];
        return searchItem();
      },
    );
  }
}
