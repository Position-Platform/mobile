import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/tools.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/modules/map/blocs/search/search_bloc.dart';
import 'package:position/src/modules/map/submodules/etablissements/widgets/etablissementcard.dart';
import 'package:position/src/modules/map/submodules/filters/widgets/filter.dart';
import 'package:position/src/modules/map/tools/searchdelegate.dart';
import 'package:position/src/modules/map/widgets/drawer.dart';
import 'package:position/src/modules/map/widgets/searchbar.dart';

class EtablissementListPage extends StatefulWidget {
  const EtablissementListPage({super.key, @required this.user});
  final User? user;

  @override
  State<EtablissementListPage> createState() => _EtablissementListPageState();
}

class _EtablissementListPageState extends State<EtablissementListPage> {
  @override
  void initState() {
    super.initState();
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    changeStatusColor(whiteColor);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            searchBar(context, widget.user!, "Tourisme", "OpenSans-Bold", () {
              scaffoldKey.currentState!.openDrawer();
            }, () {
              showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(
                      hintText: S.of(context).hintSearch,
                      searchBloc: BlocProvider.of<SearchBloc>(context),
                      user: widget.user));
            }),
            filterContainer(context),
            const SizedBox(
              height: 10,
            ),
            etablissementCard(),
          ],
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
