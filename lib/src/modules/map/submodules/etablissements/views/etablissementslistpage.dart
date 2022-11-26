import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/tools.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/modules/map/blocs/map/map_bloc.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/category.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/etablissement.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/type_commodites_model/types_commodite.dart';
import 'package:position/src/modules/map/submodules/etablissements/widgets/etablissementcard.dart';
import 'package:position/src/modules/map/submodules/filters/widgets/filter.dart';
import 'package:position/src/modules/map/widgets/drawer.dart';
import 'package:position/src/modules/map/widgets/searchbar.dart';
import 'package:position/src/widgets/loading.dart';

class EtablissementListPage extends StatefulWidget {
  const EtablissementListPage(
      {super.key,
      @required this.user,
      @required this.initialLink,
      @required this.typescommodites,
      @required this.mapBloc,
      @required this.category,
      @required this.etablissements});
  final User? user;
  final PendingDynamicLinkData? initialLink;
  final List<TypesCommodite>? typescommodites;
  final MapBloc? mapBloc;
  final Category? category;
  final List<Etablissement>? etablissements;

  @override
  State<EtablissementListPage> createState() => _EtablissementListPageState();
}

class _EtablissementListPageState extends State<EtablissementListPage> {
  @override
  void initState() {
    if (widget.etablissements!.isNotEmpty) {
      etablissements = widget.etablissements;
    }
    super.initState();
  }

  bool isLoading = false;
  List<Etablissement>? etablissements = [];

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    changeStatusColor(whiteColor);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      key: scaffoldKey,
      backgroundColor: whiteColor,
      body: BlocListener(
        bloc: widget.mapBloc,
        listener: (context, state) {
          if (state is EtablissementsLoading) {
            isLoading = true;
          }
          if (state is EtablissementsLoaded) {
            isLoading = false;
            etablissements = state.etablissements!;
          }
        },
        child: BlocBuilder(
          bloc: widget.mapBloc,
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    searchBar(context, widget.user!, widget.category!.nom!,
                        "OpenSans-Bold", () {
                      scaffoldKey.currentState!.openDrawer();
                    }, () {
                      /* showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(
                        hintText: S.of(context).hintSearch,
                        searchBloc: BlocProvider.of<SearchBloc>(context),
                        user: widget.user,
                        initialLink: widget.initialLink));*/
                    }, widget.initialLink),
                    filterContainer(context, widget.typescommodites!,
                        widget.mapBloc!, widget.category!, widget.user!),
                    const SizedBox(
                      height: 10,
                    ),
                    isLoading
                        ? loading()
                        : SingleChildScrollView(
                            physics: const ScrollPhysics(),
                            child: Column(
                              children: <Widget>[
                                ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: etablissements!.length,
                                    itemBuilder: (context, index) {
                                      return etablissementCard(
                                          context, etablissements![index]);
                                    })
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      drawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: primaryColor,
        label: Text(
          S.of(context).showmap,
          style: const TextStyle(
              fontFamily: "OpenSans-Bold", fontSize: 11, color: whiteColor),
        ),
      ),
    );
  }
}
