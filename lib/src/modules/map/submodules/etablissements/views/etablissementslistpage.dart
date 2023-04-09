import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/functions.dart';
import 'package:position/src/core/utils/tools.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/modules/map/blocs/map/map_bloc.dart';
import 'package:position/src/modules/map/models/search_model/search_model.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/category.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/datum.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/etablissements.dart';
import 'package:position/src/modules/map/submodules/etablissements/widgets/etablissementcard.dart';
import 'package:position/src/modules/map/submodules/filters/widgets/filter.dart';
import 'package:position/src/modules/map/widgets/searchbar.dart';
import 'package:position/src/widgets/loading.dart';

class EtablissementListPage extends StatefulWidget {
  const EtablissementListPage(
      {super.key,
      @required this.user,
      @required this.initialLink,
      @required this.mapBloc,
      @required this.category,
      @required this.etablissements,
      @required this.distance,
      @required this.avis,
      @required this.pertinance,
      @required this.commodites,
      @required this.page});
  final User? user;
  final PendingDynamicLinkData? initialLink;
  final MapBloc? mapBloc;
  final Category? category;
  final Etablissements? etablissements;
  final bool? distance;
  final bool? avis;
  final bool? pertinance;
  final String? commodites;
  final int? page;

  @override
  State<EtablissementListPage> createState() => _EtablissementListPageState();
}

class _EtablissementListPageState extends State<EtablissementListPage> {
  late ScrollController _scrollController;

  bool _hasNextPage = true;

  bool _isLoadMoreRunning = false;

  int _page = 2;

  @override
  void initState() {
    if (widget.etablissements!.data!.isNotEmpty) {
      etablissements = widget.etablissements!.data;
    }

    if (widget.page != null) {
      _page = widget.page!;
    }

    if (widget.commodites != null) {
      commodites = widget.commodites!;
    }

    if (widget.distance != null) {
      distance = widget.distance!;
    }

    if (widget.avis != null) {
      avis = widget.avis!;
    }

    if (widget.pertinance != null) {
      pertinance = widget.pertinance!;
    }

    _scrollController = ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 300) {
      widget.mapBloc!.add(LoadMoreEtablissement(
          _hasNextPage,
          _isLoadMoreRunning,
          _page,
          widget.category!,
          widget.user!,
          distance!,
          avis!,
          pertinance!,
          commodites!,
          widget.etablissements));
    }
  }

  bool isLoading = false;
  List<Datum>? etablissements = [];

  String? commodites = "";
  bool? distance = true;
  bool? avis = false;
  bool? pertinance = false;

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    changeStatusColor(whiteColor);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      key: scaffoldKey,
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: BlocListener(
          bloc: widget.mapBloc,
          listener: (context, state) {
            if (state is LoadMoreRunning) {
              _isLoadMoreRunning = true;
            }
            if (state is HasNextPage) {
              _isLoadMoreRunning = false;
              _hasNextPage = false;
              Fluttertoast.showToast(
                  msg: S.of(context).etablissementLoadComplete,
                  backgroundColor: accentColor,
                  textColor: whiteColor,
                  toastLength: Toast.LENGTH_SHORT);
            }
            if (state is EtablissementsLoading) {
              isLoading = true;
            }

            if (state is EtablissementsLoaded) {
              isLoading = false;
              etablissements = state.etablissements!.data;
            }
            if (state is EtablissementsMoreLoaded) {
              _isLoadMoreRunning = false;
              _page += 1;
              etablissements!.addAll(state.etablissements!.data!);
              if (state.distance!) {
                etablissements!
                    .sort((a, b) => a.distance!.compareTo(b.distance!));
              }
              if (state.avis!) {
                etablissements!.sort((a, b) => b.avis!.compareTo(a.avis!));
              }
              if (state.pertinance!) {
                etablissements!.sort((a, b) => b.vues!.compareTo(a.vues!));
              }
              distance = state.distance;
              avis = state.avis;
              pertinance = state.pertinance;

              Fluttertoast.showToast(
                  msg: S.of(context).etablissementAdded,
                  backgroundColor: primaryColor,
                  textColor: whiteColor,
                  toastLength: Toast.LENGTH_SHORT);
            }
            if (state is EtablissementsError) {
              _isLoadMoreRunning = false;
            }
          },
          child: BlocBuilder(
            bloc: widget.mapBloc,
            builder: (context, state) {
              return SafeArea(
                child: Column(
                  children: [
                    searchBar(context, widget.user!, widget.category!.nom!,
                        "OpenSans-Bold", () {
                      scaffoldKey.currentState!.openDrawer();
                    }, () {}, widget.initialLink),
                    filterContainer(context, widget.mapBloc!, widget.category!,
                        widget.user!, widget.commodites!),
                    isLoading
                        ? Column(
                            children: [
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height - 200,
                                  child: loading()),
                            ],
                          )
                        : etablissements!.isEmpty
                            ? Column(
                                children: [
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height -
                                              200,
                                      child: Center(
                                        child: Text(S.of(context).noData),
                                      )),
                                ],
                              )
                            : Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: etablissements!.length,
                                        controller: _scrollController,
                                        itemBuilder: (context, index) {
                                          return etablissementCard(
                                              context, etablissements![index],
                                              () async {
                                            widget.mapBloc!.add(
                                                UpdateViewEtablissement(
                                                    etablissements![index].id));

                                            var searchModel = SearchModel(
                                                name:
                                                    etablissements![index].nom,
                                                details: etablissements![index]
                                                    .sousCategories![0]
                                                    .nom,
                                                type: "etablissement",
                                                id: etablissements![index]
                                                    .id
                                                    .toString(),
                                                longitude: etablissements![index]
                                                    .batiment!
                                                    .longitude,
                                                latitude: etablissements![index]
                                                    .batiment!
                                                    .latitude,
                                                logo: etablissements![index].logo ??
                                                    etablissements![index]
                                                        .sousCategories![0]
                                                        .logourl ??
                                                    etablissements![index]
                                                        .sousCategories![0]
                                                        .category!
                                                        .logourl,
                                                logomap: etablissements![index].logoMap ??
                                                    etablissements![index]
                                                        .sousCategories![0]
                                                        .logourlmap ??
                                                    etablissements![index]
                                                        .sousCategories![0]
                                                        .category!
                                                        .logourlmap,
                                                etablissement:
                                                    etablissements![index],
                                                isOpenNow: etablissements![index]
                                                    .isopen,
                                                plageDay: checkIfEtablissementIsOpen(
                                                    etablissements![index]),
                                                distance: await calculateDistance(
                                                    etablissements![index].batiment!.longitude!, etablissements![index].batiment!.latitude!));

                                            widget.mapBloc!.add(ShowSearchInMap(
                                                searchModel, widget.user));

                                            // ignore: use_build_context_synchronously
                                            Navigator.pop(context,
                                                "${widget.distance},${widget.avis},${widget.pertinance},${widget.commodites}");
                                          });
                                        }),
                                  ),
                                ],
                              ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      // drawer: const AppDrawer(),
      floatingActionButton: BlocBuilder(
          bloc: widget.mapBloc,
          builder: (context, state) {
            return _isLoadMoreRunning
                ? const CircularProgressIndicator()
                : FloatingActionButton.extended(
                    heroTag: "showmap",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    backgroundColor: primaryColor,
                    label: Text(
                      S.of(context).showmap,
                      style: const TextStyle(
                          fontFamily: "OpenSans-Bold",
                          fontSize: 11,
                          color: whiteColor),
                    ),
                  );
          }),
    );
  }
}
