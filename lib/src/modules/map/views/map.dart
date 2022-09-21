import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
import 'package:position/src/modules/map/tools/searchdelegate.dart';
import 'package:position/src/modules/map/widgets/categories.dart';
import 'package:position/src/modules/map/widgets/drawer.dart';
import 'package:position/src/modules/map/widgets/searchbar.dart';
import 'package:position/src/widgets/loading.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key, @required this.user});
  final User? user;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapBloc? _mapBloc;

  List<Category>? categories = [];

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _mapBloc = BlocProvider.of<MapBloc>(context);

    _mapBloc?.add(GetCategories());
  }

  bool isExpanded = false;
  bool isCategoriesLoading = false;

  @override
  Widget build(BuildContext context) {
    changeStatusColor(whiteColor);
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: BlocListener<MapBloc, MapState>(
        listener: (context, state) {
          if (state is CategoriesLoading) {
            isCategoriesLoading = true;
          }
          if (state is CategoriesLoaded) {
            isCategoriesLoading = false;
            categories = state.categories!.data!.categories;
          }
        },
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return Stack(children: [
              MapboxMap(
                rotateGesturesEnabled: false,
                annotationOrder: const [AnnotationType.symbol],
                compassViewPosition: CompassViewPosition.TopRight,
                zoomGesturesEnabled: true,
                myLocationEnabled: true,
                myLocationTrackingMode: MyLocationTrackingMode.Tracking,
                compassEnabled: true,
                styleString:
                    "mapbox://styles/gauty96/ckz194r6x000616o9hq4pcgkz",
                accessToken: mapboxApiKey,
                // onMapLongClick: (point, latLng) => mapBloc?.add(NewBatiment(latLng)),
                onMapCreated: (controller) =>
                    _mapBloc?.add(OnMapInitializedEvent(controller)),
                doubleClickZoomEnabled: true,
                initialCameraPosition: const CameraPosition(
                    zoom: initMapZoom, target: LatLng(0, 0)),
              ),
              SafeArea(
                child: Column(
                  children: [
                    searchBar(
                        context, widget.user!, S.of(context).search, "OpenSans",
                        () {
                      scaffoldKey.currentState!.openDrawer();
                    }, () async {
                      var result = await showSearch(
                          context: context,
                          delegate: CustomSearchDelegate(
                              hintText: S.of(context).hintSearch,
                              searchBloc: BlocProvider.of<SearchBloc>(context),
                              user: widget.user)) as SearchModel;

                      setState(() {
                        _mapBloc?.add(ShowSearchInMap(result));
                      });
                    }),
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
                                            ? Text(S.of(context).hideCategorie,
                                                style: const TextStyle(
                                                  fontFamily: 'OpenSans',
                                                  color: grey3,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                  fontStyle: FontStyle.normal,
                                                ))
                                            : Text(S.of(context).showCategorie,
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
                    )
                  ],
                ),
              ),
            ]);
          },
        ),
      ),
      floatingActionButton: Stack(children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Wrap(
            direction: Axis.vertical,
            children: [
              SizedBox(
                child: FloatingActionButton(
                  heroTag: "location",
                  tooltip: "Location",
                  backgroundColor: Theme.of(context).backgroundColor,
                  onPressed: () {
                    _mapBloc?.add(GetUserLocationEvent());
                  },
                  child: SvgPicture.asset(
                    "assets/images/svg/icon-my_location.svg",
                  ),
                ),
              )
            ],
          ),
        )
      ]),
      drawer: const AppDrawer(),
    );
  }
}
