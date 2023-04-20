import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/app/bloc/app_bloc.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/modules/map/blocs/map/map_bloc.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/datum.dart';
import 'package:position/src/modules/map/submodules/etablissements/views/etablissementfavorispage.dart';
import 'package:position/src/widgets/footer.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer(
      {super.key,
      @required this.mapBloc,
      @required this.user,
      @required this.favoris});
  final List<Datum>? favoris;
  final MapBloc? mapBloc;
  final User? user;

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  AppBloc? _appBloc;

  @override
  void initState() {
    super.initState();
    _appBloc = BlocProvider.of<AppBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    final Locale appLocale = Localizations.localeOf(context);
    return Container(
      width: 270,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
              color: Color(0x33000000),
              offset: Offset(0, 3),
              blurRadius: 5,
              spreadRadius: -1),
          BoxShadow(
              color: Color(0x1e000000),
              offset: Offset(0, 1),
              blurRadius: 18,
              spreadRadius: 0),
          BoxShadow(
              color: Color(0x23000000),
              offset: Offset(0, 6),
              blurRadius: 10,
              spreadRadius: 0)
        ],
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/png/logo-nom.png",
                  height: 46,
                  width: 150,
                ),
                const Spacer(),
                InkWell(
                  highlightColor: transparent,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 10, right: 10),
                      child:
                          SvgPicture.asset("assets/images/svg/icon-clear.svg")),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            highlightColor: transparent,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return EtablissementFavorisPage(
                      mapBloc: widget.mapBloc,
                      user: widget.user,
                      favoris: widget.favoris,
                    );
                  },
                ),
              );
            },
            child: ListTile(
              leading: SvgPicture.asset(
                  "assets/images/svg/icon-icon-action-vignette-enregistrer.svg"),
              title: Text(
                S.of(context).savedplaces,
                style: const TextStyle(
                    fontSize: 12, fontFamily: "OpenSans", color: greyColor),
              ),
              horizontalTitleGap: 1,
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(
                "assets/images/svg/icon-icon-menu-list-avis.svg"),
            title: Text(
              S.of(context).myreviews,
              style: const TextStyle(
                  fontSize: 12, fontFamily: "OpenSans", color: greyColor),
            ),
            horizontalTitleGap: 1,
          ),
          InkWell(
            highlightColor: transparent,
            onTap: () {
              Navigator.pop(context);
              widget.mapBloc!.add(RemoveDownloadMap());
            },
            child: ListTile(
              leading: SvgPicture.asset("assets/images/svg/icon-clear.svg"),
              title: const Text(
                "Supprimer les cartes enregistrées",
                style: TextStyle(
                    fontSize: 12, fontFamily: "OpenSans", color: greyColor),
              ),
              horizontalTitleGap: 1,
            ),
          ),
          const Spacer(),
          appFooter(context, appLocale, _appBloc)
        ],
      ),
    );
  }
}
