// ignore_for_file: null_check_always_fails

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/modules/map/blocs/search/search_bloc.dart';
import 'package:position/src/modules/map/models/search_model/search_model.dart';
import 'package:position/src/modules/map/views/profile.dart';
import 'package:position/src/modules/map/widgets/searchItem.dart';
import 'package:position/src/widgets/loading.dart';

class CustomSearchDelegate extends SearchDelegate {
  final String? hintText;
  final SearchBloc? searchBloc;
  final User? user;
  final PendingDynamicLinkData? initialLink;
  CustomSearchDelegate(
      {this.hintText,
      @required this.searchBloc,
      @required this.user,
      @required this.initialLink});
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
      InkWell(
        highlightColor: transparent,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProfilePage(
                  user: user,
                  initialLink: initialLink,
                );
              },
            ),
          );
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 10),
          height: 20,
          width: 40,
          child: SvgPicture.asset("assets/images/svg/icon-perm_identity.svg"),
        ),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, SearchModel());
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
          return Center(
            child: Text(S.of(context).searcherror),
          );
        }
        if (state is SearchLoaded) {
          searchBloc!.add(AddSuggestion(query));
          if (state.searchresult!.isEmpty) {
            return Center(
              child: Text(S.of(context).searchnotfound),
            );
          }

          return ListView.builder(
            itemCount: state.searchresult!.length,
            itemBuilder: (context, index) {
              return InkWell(
                  highlightColor: transparent,
                  onTap: () {
                    close(context, state.searchresult![index]);
                  },
                  child: searchItem(context, state.searchresult![index]));
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
    searchBloc!.add(GetSuggestions());
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is ListSuggestions) {
          List<String> matchQuery = [];
          for (var suggestion in state.suggestions!) {
            if (suggestion.toLowerCase().contains(query.toLowerCase())) {
              matchQuery.add(suggestion);
            }
          }
          return ListView.builder(
            itemCount: matchQuery.length,
            itemBuilder: (context, index) {
              //  var result = matchQuery[index];
              return ListTile(
                title: Text(
                  matchQuery[index],
                  maxLines: 1,
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
