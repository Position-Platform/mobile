import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/modules/map/blocs/search/search_bloc.dart';
import 'package:position/src/modules/map/widgets/searchItem.dart';
import 'package:position/src/widgets/loading.dart';

class CustomSearchDelegate extends SearchDelegate {
  final String? hintText;
  final SearchBloc? searchBloc;
  final User? user;
  CustomSearchDelegate(
      {this.hintText, @required this.searchBloc, @required this.user});
  String? queryString;

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
    queryString = query;
    searchBloc!.add(MakeSearch(query, user));
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading && query.isNotEmpty) {
          return Container(
            child: loading(),
          );
        }
        if (state is SearchError) {
          if (query.isEmpty) {
            return const Center(
              child: Text('Aucune entrée'),
            );
          }
          return const Center(
            child: Text('Failed To Load'),
          );
        }
        if (state is SearchLoaded) {
          if (state.searchresult!.isEmpty) {
            return const Center(
              child: Text('No Results Found'),
            );
          }
          return ListView.builder(
            itemCount: state.searchresult!.length,
            itemBuilder: (context, index) {
              return searchItem(state.searchresult![index]);
            },
          );
        }
        return const Scaffold();
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    /* List<String> matchQuery = [];
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
    );*/
    return Container();
  }
}
