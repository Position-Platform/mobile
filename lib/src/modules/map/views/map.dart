// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/configs.dart';
import 'package:position/src/core/utils/tools.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/modules/map/blocs/map/map_bloc.dart';
import 'package:position/src/modules/map/blocs/search/search_bloc.dart';
import 'package:position/src/modules/map/models/search_model/search_model.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/category.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/datum.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/etablissements.dart';
import 'package:position/src/modules/map/submodules/etablissements/views/etablissementpage.dart';
import 'package:position/src/modules/map/submodules/etablissements/views/etablissementslistpage.dart';
import 'package:position/src/modules/map/submodules/filters/widgets/filter.dart';
import 'package:position/src/modules/map/tools/searchdelegate.dart';
import 'package:position/src/modules/map/widgets/categories.dart';
import 'package:position/src/modules/map/widgets/drawer.dart';
import 'package:position/src/modules/map/widgets/placebottomsheet.dart';
import 'package:position/src/modules/map/widgets/searchbar.dart';
import 'package:position/src/widgets/loading.dart';
import 'package:share_plus/share_plus.dart';

class MapPage extends StatefulWidget {
  PendingDynamicLinkData? initialLink;
  MapPage({super.key, @required this.user, @required this.initialLink});
  final User? user;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapBloc? _mapBloc;

  List<Category>? categories = [];

  var scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ExpandableBottomSheetState> expandablesheet = GlobalKey();

  bool isMarkerAdded = false;

  SearchModel? searchModel;

  List<Datum>? favoris = [];

  @override
  void initState() {
    super.initState();

    _mapBloc = BlocProvider.of<MapBloc>(context);

    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      var searchModel = SearchModel.fromJson(
          json.decode(dynamicLinkData.link.queryParameters['searchmodel']!));
      _mapBloc?.add(ShowSearchInMap(searchModel, widget.user));
    }).onError((error) {});

    _mapBloc?.add(GetCategories());
    _mapBloc?.add(GetFavorite());
  }

  bool isExpanded = false;
  bool isCategoriesLoading = false;
  bool categorieSelected = false;
  Category? category;
  bool showList = false;
  Etablissements? etablissements = Etablissements(data: []);
  bool expandedClose = false;

  int? page;
  String? idsCommodite;
  bool? distance;
  bool? avis;
  bool? pertinance;

  @override
  Widget build(BuildContext context) {
    changeStatusColor(transparent);
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: BlocListener<MapBloc, MapState>(
        listener: (context, state) {
          if (state is MapInitialized) {
            if (widget.initialLink != null) {
              final Uri deepLink = widget.initialLink!.link;

              var searchModel = SearchModel.fromJson(
                  json.decode(deepLink.queryParameters['searchmodel']!));

              _mapBloc?.add(ShowSearchInMap(searchModel, widget.user));
            }
          }
          if (state is CategoriesLoading) {
            isCategoriesLoading = true;
          }
          if (state is CategoriesLoaded) {
            isCategoriesLoading = false;
            categories = state.categories!.data!.categories;
          }
          if (state is CategoriesClicked) {
            categorieSelected = state.isClicked!;
            category = state.category;
          }

          if (state is ExpandedClose) {
            isMarkerAdded = false;
            if (etablissements!.data!.isNotEmpty) {
              showList = true;
            }
            expandedClose = true;
            //  expandablesheet.currentState!.contract();
          }

          if (state is SymboledAdded) {
            isMarkerAdded = true;
            showList = false;
            expandedClose = false;
            searchModel = state.searchresult;
          }
          if (state is SymboleRemoved) {
            isMarkerAdded = false;
            showList = false;
            expandedClose = false;
            etablissements = Etablissements(data: []);
            _mapBloc!.add(CategorieClick(false, category));
          }
          if (state is SymboleClicked) {
            if (searchModel!.type == "etablissement") {
              isMarkerAdded = true;
              expandedClose = false;
              //  expandablesheet.currentState!.expand();
              _mapBloc!
                  .add(UpdateViewEtablissement(searchModel!.etablissement!.id));
            }
          }
          if (state is PlaceShared) {
            Share.share(
              state.url!,
            );
          }
          if (state is EtablissementsLoaded) {
            showList = true;
            etablissements = state.etablissements!;
            Fluttertoast.showToast(
                msg: S.of(context).etablissementLoaded,
                backgroundColor: primaryColor,
                textColor: whiteColor,
                toastLength: Toast.LENGTH_SHORT);
          }
          if (state is EtablissementsError) {
            Fluttertoast.showToast(
                msg: S.of(context).etablissementError,
                backgroundColor: redColor,
                textColor: whiteColor,
                toastLength: Toast.LENGTH_SHORT);
          }
          if (state is EtablissementsMoreLoaded) {
            etablissements = state.etablissements!;
            etablissements!.data!
                .sort((a, b) => a.distance!.compareTo(b.distance!));
            page = state.page;
            distance = state.distance;
            avis = state.avis;
            pertinance = state.pertinance;
          }
          if (state is ReviewAdded) {
            Fluttertoast.showToast(
                msg: S.of(context).reviewadded,
                backgroundColor: primaryColor,
                textColor: whiteColor,
                toastLength: Toast.LENGTH_SHORT);
          }
          if (state is ReviewError) {
            Fluttertoast.showToast(
                msg: S.of(context).reviewerror,
                backgroundColor: redColor,
                textColor: whiteColor,
                toastLength: Toast.LENGTH_SHORT);
          }
          if (state is FavoriteLoaded) {
            favoris = state.favoris;
          }
          if (state is FavoriteAdded) {
            state.favoris!.isFavoris = true;
            favoris!.add(state.favoris!);
          }
          if (state is FavoriteRemoved) {
            state.favoris!.isFavoris = false;
            favoris!.remove(state.favoris!);
          }
        },
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return ExpandableBottomSheet(
              animationDurationContract: const Duration(milliseconds: 500),
              animationDurationExtend: const Duration(milliseconds: 500),
              key: expandablesheet,
              enableToggle: true,
              expandableContent: isMarkerAdded &&
                      !expandedClose &&
                      searchModel!.type == "etablissement"
                  ? etablissementPage(widget.user!, context, searchModel!,
                      _mapBloc!, expandablesheet)
                  : const SizedBox(),
              persistentHeader: isMarkerAdded && !expandedClose
                  ? placeBottomSheet(
                      context,
                      searchModel!,
                      _mapBloc!,
                      categories!,
                      widget.user!,
                      widget.initialLink,
                      favoris,
                    )
                  : const SizedBox(),
              background: Stack(children: [
                MapboxMap(
                  rotateGesturesEnabled: false,
                  annotationOrder: const [AnnotationType.symbol],
                  compassViewPosition: CompassViewPosition.TopRight,
                  zoomGesturesEnabled: true,
                  myLocationEnabled: true,
                  myLocationTrackingMode: MyLocationTrackingMode.Tracking,
                  compassEnabled: true,
                  onMapClick: (point, coordinates) =>
                      _mapBloc?.add(RemoveSymboleInMap()),
                  styleString: MapboxStyles.MAPBOX_STREETS,
                  accessToken: mapboxApiKey,
                  onMapLongClick: (point, latLng) =>
                      _mapBloc?.add(AddSymboleOnMap(latLng)),
                  onMapCreated: (controller) => _mapBloc
                      ?.add(OnMapInitializedEvent(controller, widget.user)),
                  doubleClickZoomEnabled: true,
                  initialCameraPosition: const CameraPosition(
                      zoom: initMapZoom, target: LatLng(0, 0)),
                ),
                SafeArea(
                  child: Column(
                    children: [
                      searchBar(context, widget.user!, S.of(context).search,
                          "OpenSans", () {
                        scaffoldKey.currentState!.openDrawer();
                      }, () async {
                        var result = await showSearch(
                                context: context,
                                delegate: CustomSearchDelegate(
                                    hintText: S.of(context).hintSearch,
                                    searchBloc:
                                        BlocProvider.of<SearchBloc>(context),
                                    user: widget.user,
                                    initialLink: widget.initialLink))
                            as SearchModel;

                        setState(() {
                          _mapBloc?.add(ShowSearchInMap(result, widget.user));
                        });
                      }, widget.initialLink),
                      categorieSelected
                          ? const SizedBox()
                          : const SizedBox(
                              height: 5,
                            ),
                      categorieSelected
                          ? filterContainer(
                              context, _mapBloc!, category!, widget.user!)
                          : Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20.0), //<-- SEE HERE
                              ),
                              elevation: 10,
                              child: isCategoriesLoading
                                  ? Container(
                                      child: loading(),
                                    )
                                  : Container(
                                      margin: const EdgeInsets.only(
                                          left: 4, top: 10),
                                      child: Column(
                                        children: [
                                          Theme(
                                            data: Theme.of(context).copyWith(
                                                dividerColor: transparent),
                                            child: Wrap(
                                              spacing: 12.0,
                                              runSpacing: 1.0,
                                              children: generateCategoryWidget(
                                                  categories!,
                                                  _mapBloc,
                                                  isExpanded),
                                            ),
                                          ),
                                          InkWell(
                                            highlightColor: transparent,
                                            onTap: () {
                                              setState(() {
                                                isExpanded = !isExpanded;
                                              });
                                            },
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                isExpanded
                                                    ? Text(
                                                        S
                                                            .of(context)
                                                            .hideCategorie,
                                                        style: const TextStyle(
                                                          fontFamily:
                                                              'OpenSans',
                                                          color: grey3,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                        ))
                                                    : Text(
                                                        S
                                                            .of(context)
                                                            .showCategorie,
                                                        style: const TextStyle(
                                                          fontFamily:
                                                              'OpenSans',
                                                          color: grey3,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                        )),
                                                isExpanded
                                                    ? SvgPicture.asset(
                                                        "assets/images/svg/icon-icon-see-less.svg")
                                                    : SvgPicture.asset(
                                                        "assets/images/svg/icon-icon-see-more.svg")
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                            )
                    ],
                  ),
                ),
              ]),
            );
          },
        ),
      ),
      floatingActionButton:
          BlocBuilder<MapBloc, MapState>(builder: (context, state) {
        return Stack(children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Wrap(
              direction: Axis.vertical,
              children: [
                !isMarkerAdded
                    ? SizedBox(
                        child: FloatingActionButton(
                          heroTag: "location",
                          tooltip: "Location",
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          onPressed: () {
                            _mapBloc?.add(GetUserLocationEvent());
                          },
                          child: SvgPicture.asset(
                            "assets/images/svg/icon-my_location.svg",
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Wrap(
              direction: Axis.vertical,
              children: [
                showList
                    ? SizedBox(
                        child: FloatingActionButton.extended(
                          heroTag: "Show List",
                          tooltip: "Show List",
                          label: Text(S.of(context).showlist,
                              style: const TextStyle(
                                  fontFamily: "OpenSans-Bold",
                                  fontSize: 11,
                                  color: whiteColor)),
                          backgroundColor: primaryColor,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return EtablissementListPage(
                                    initialLink: widget.initialLink,
                                    mapBloc: _mapBloc,
                                    category: category,
                                    user: widget.user,
                                    etablissements: etablissements,
                                    avis: avis,
                                    distance: distance,
                                    idsCommodite: idsCommodite,
                                    page: page,
                                    pertinance: pertinance,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ]);
      }),
      drawer: BlocBuilder<MapBloc, MapState>(builder: (context, state) {
        return AppDrawer(
            mapBloc: _mapBloc!, user: widget.user, favoris: favoris);
      }),
    );
  }
}
