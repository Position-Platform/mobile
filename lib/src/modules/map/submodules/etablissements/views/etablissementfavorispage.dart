import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/functions.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/modules/map/blocs/map/map_bloc.dart';
import 'package:position/src/modules/map/models/search_model/search_model.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/datum.dart';
import 'package:position/src/modules/map/submodules/etablissements/widgets/etablissementcard.dart';

class EtablissementFavorisPage extends StatefulWidget {
  const EtablissementFavorisPage(
      {super.key,
      @required this.favoris,
      @required this.mapBloc,
      @required this.user});
  final List<Datum>? favoris;
  final MapBloc? mapBloc;
  final User? user;

  @override
  State<EtablissementFavorisPage> createState() =>
      _EtablissementFavorisPageState();
}

class _EtablissementFavorisPageState extends State<EtablissementFavorisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<MapBloc, MapState>(
      listener: (context, state) {},
      child: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          return SingleChildScrollView(
              child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 32.0),
                  Text(
                    S.of(context).favoris,
                    style: const TextStyle(
                        fontFamily: "OpenSans-Bold", fontSize: 16),
                  ),
                  InkWell(
                      highlightColor: transparent,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:
                          SvgPicture.asset("assets/images/svg/icon-clear.svg"))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: whiteColor,
                child: widget.favoris!.isEmpty
                    ? Center(
                        child: Text(
                          S.of(context).nofavoris,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.favoris!.length,
                        itemBuilder: (context, index) {
                          return etablissementCard(
                              context, widget.favoris![index], () async {
                            widget.mapBloc!.add(UpdateViewEtablissement(
                                widget.favoris![index].id));

                            var searchModel = SearchModel(
                                name: widget.favoris![index].nom,
                                details: widget
                                    .favoris![index].sousCategories![0].nom,
                                type: "etablissement",
                                id: widget.favoris![index].id.toString(),
                                longitude:
                                    widget.favoris![index].batiment!.longitude,
                                latitude:
                                    widget.favoris![index].batiment!.latitude,
                                logo: widget.favoris![index].logo ??
                                    widget.favoris![index].sousCategories![0]
                                        .logourl ??
                                    widget.favoris![index].sousCategories![0]
                                        .category!.logourl,
                                logomap: widget.favoris![index].logoMap ??
                                    widget.favoris![index].sousCategories![0]
                                        .logourlmap ??
                                    widget.favoris![index].sousCategories![0]
                                        .category!.logourlmap,
                                etablissement: widget.favoris![index],
                                isOpenNow: widget.favoris![index].isopen,
                                plageDay: checkIfEtablissementIsOpen(
                                    widget.favoris![index]),
                                distance: await calculateDistance(
                                    widget.favoris![index].batiment!.longitude!,
                                    widget
                                        .favoris![index].batiment!.latitude!));

                            widget.mapBloc!
                                .add(ShowSearchInMap(searchModel, widget.user));

                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                          });
                        }),
              )
            ],
          ));
        },
      ),
    ));
  }
}
