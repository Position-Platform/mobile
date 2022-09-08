import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/configs.dart';
import 'package:position/src/core/utils/tools.dart';
import 'package:position/src/modules/map/bloc/map_bloc.dart';
import 'package:position/src/modules/map/tools/searchdelegate.dart';
import 'package:position/src/modules/map/widgets/chips.dart';
import 'package:position/src/modules/map/widgets/expanded.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapBloc? _mapBloc;

  @override
  void initState() {
    super.initState();
    _mapBloc = BlocProvider.of<MapBloc>(context);
  }

  bool isExpanded = false;

  List<Widget> _generateChildrenWithCustomHeight(int count) {
    List<Widget> items = [];
    List<Widget> items2 = [];

    for (int i = 0; i < count; i++) {
      if (i < 4) {
        items.add(Container(
          margin: const EdgeInsets.only(left: 10),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10.0,
            runSpacing: 1.0,
            children: [buildChip("Achats", "assets/images/svg/icon-help.svg")],
          ),
        ));
      } else {
        items2.add(buildChip("Testament", "assets/images/svg/icon-help.svg"));
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

  @override
  Widget build(BuildContext context) {
    changeStatusColor(transparent);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<MapBloc, MapState>(
        listener: (context, state) {},
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
                initialCameraPosition:
                    const CameraPosition(zoom: 15.0, target: LatLng(0, 0)),
              ),
              SafeArea(
                child: Column(
                  children: [
                    Card(
                      elevation: 10,
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        color: whiteColor,
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              height: 20,
                              width: 20,
                              child: SvgPicture.asset(
                                  "assets/images/svg/icon-menu.svg"),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                showSearch(
                                    context: context,
                                    delegate: CustomSearchDelegate());
                              },
                              child: Text(
                                S.of(context).search,
                                style: const TextStyle(
                                    fontFamily: "OpenSans", color: grey4),
                              ),
                            ),
                            const Spacer(),
                            const VerticalDivider(
                              color: grey3,
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 20,
                              width: 20,
                              child: SvgPicture.asset(
                                  "assets/images/svg/icon-perm_identity.svg"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20.0), //<-- SEE HERE
                      ),
                      elevation: 10,
                      child: Container(
                        margin: const EdgeInsets.only(left: 4, top: 10),
                        child: Column(
                          children: [
                            Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: transparent),
                              child: Wrap(
                                spacing: 12.0,
                                runSpacing: 1.0,
                                children: _generateChildrenWithCustomHeight(27),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
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
                height: 50,
                width: 50,
                child: FloatingActionButton(
                  heroTag: "location",
                  mini: true,
                  tooltip: "Location",
                  backgroundColor: Theme.of(context).backgroundColor,
                  onPressed: () {},
                  child: SvgPicture.asset(
                    "assets/images/svg/icon-my_location.svg",
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
