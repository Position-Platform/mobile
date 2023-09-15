// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:math';

import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maplibre_gl/mapbox_gl.dart';
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
import 'package:position/src/modules/map/submodules/filters/views/filterpage.dart';
import 'package:position/src/modules/map/submodules/search/tools/searchdelegate.dart';
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
  Category? category;
  bool showList = false;
  Etablissements? etablissements = Etablissements(data: []);
  bool expandedClose = false;

  int? page;
  bool? distance;
  bool? avis;
  bool? pertinance;
  String? commodites = "";

  bool isLoadng = false;

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
            categories = state.categories!;
          }
          if (state is CategoriesClicked) {
            category = state.category;
            Navigator.push(context, MaterialPageRoute(
              builder: ((context) {
                return FiltersPage(
                  category: state.category,
                  mapbloc: _mapBloc,
                  user: widget.user,
                );
              }),
            ));
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
            //  _mapBloc!.add(CategorieClick(category));
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
            commodites = state.commodites;
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
          if (state is DownloadComplete) {
            Fluttertoast.showToast(
                msg: S.of(context).successDownload,
                backgroundColor: primaryColor,
                textColor: whiteColor,
                toastLength: Toast.LENGTH_SHORT);
          }
          if (state is MapDownDownloading) {}
          if (state is MapDownloadedError) {}
          if (state is DownloadMapRemoved) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(S.of(context).removeMap),
              backgroundColor: redColor,
              duration: const Duration(seconds: 3),
            ));
          }
          if (state is RoutingLoading ||
              state is SharedLoading ||
              state is FavoriteAddProcess ||
              state is FavoriteRemoveProcess) {
            isLoadng = true;
          }
          if (state is RoutingAdded ||
              state is PlaceShared ||
              state is FavoriteAdded ||
              state is FavoriteRemoved) {
            isLoadng = false;
          }
          if (state is RoutingError) {
            isLoadng = false;
            Fluttertoast.showToast(
                msg: S.of(context).routingError,
                backgroundColor: redColor,
                textColor: whiteColor,
                toastLength: Toast.LENGTH_SHORT);
          }

          if (state is SharedError) {
            isLoadng = false;
            Fluttertoast.showToast(
                msg: S.of(context).sharedError,
                backgroundColor: redColor,
                textColor: whiteColor,
                toastLength: Toast.LENGTH_SHORT);
          }
          if (state is FavoriteError) {
            isLoadng = false;
            Fluttertoast.showToast(
                msg: S.of(context).error,
                backgroundColor: redColor,
                textColor: whiteColor,
                toastLength: Toast.LENGTH_SHORT);
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
                MaplibreMap(
                  attributionButtonPosition:
                      AttributionButtonPosition.BottomLeft,
                  attributionButtonMargins: const Point(-100, -100),
                  rotateGesturesEnabled: false,
                  annotationOrder: const [AnnotationType.symbol],
                  compassViewPosition: CompassViewPosition.BottomLeft,
                  zoomGesturesEnabled: true,
                  myLocationEnabled: true,
                  myLocationTrackingMode: MyLocationTrackingMode.Tracking,
                  myLocationRenderMode: MyLocationRenderMode.GPS,
                  compassEnabled: true,
                  onMapClick: (point, coordinates) =>
                      _mapBloc?.add(RemoveSymboleInMap()),
                  styleString:
                      'https://api.maptiler.com/maps/streets-v2/style.json?key=GZun6glaQh7PwnoBZoOm',
                  onMapLongClick: (point, latLng) =>
                      _mapBloc?.add(AddSymboleOnMap(latLng)),
                  onMapCreated: (controller) => _mapBloc
                      ?.add(OnMapInitializedEvent(controller, widget.user)),
                  doubleClickZoomEnabled: true,
                  initialCameraPosition: const CameraPosition(
                      zoom: initialMapZoom, target: LatLng(0, 0)),
                  onStyleLoadedCallback: () {},
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
                      const SizedBox(
                        height: 5,
                      ),
                      Card(
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
                                margin: const EdgeInsets.only(left: 4, top: 10),
                                child: Column(
                                  children: [
                                    Theme(
                                      data: Theme.of(context)
                                          .copyWith(dividerColor: transparent),
                                      child: Wrap(
                                        spacing: 12.0,
                                        runSpacing: 1.0,
                                        children: generateCategoryWidget(
                                            categories!, _mapBloc, isExpanded),
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
                                                  S.of(context).hideCategorie,
                                                  style: const TextStyle(
                                                    fontFamily: 'OpenSans',
                                                    color: grey3,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
                                                  ))
                                              : Text(
                                                  S.of(context).showCategorie,
                                                  style: const TextStyle(
                                                    fontFamily: 'OpenSans',
                                                    color: grey3,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    fontStyle: FontStyle.normal,
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
                      ),
                      isLoadng
                          ? Container(
                              margin: EdgeInsets.only(
                                  top: 10,
                                  left:
                                      MediaQuery.of(context).size.width - 100),
                              child: const CircularProgressIndicator(
                                color: primaryColor,
                                strokeWidth: 4,
                              ),
                            )
                          : const SizedBox()
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
                                    page: page,
                                    pertinance: pertinance,
                                    commodites: commodites,
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
