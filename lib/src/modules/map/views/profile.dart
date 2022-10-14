// ignore_for_file: must_be_immutable

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/app/bloc/app_bloc.dart';
import 'package:position/src/core/di/di.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/configs.dart';
import 'package:position/src/core/utils/sizes.dart';
import 'package:position/src/core/utils/tools.dart';
import 'package:position/src/init.dart';
import 'package:position/src/modules/auth/blocs/auth/auth_bloc.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/widgets/footer.dart';

class ProfilePage extends StatefulWidget {
  PendingDynamicLinkData? initialLink;
  ProfilePage({super.key, @required this.user, @required this.initialLink});
  final User? user;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AppBloc? _appBloc;

  @override
  void initState() {
    super.initState();
    _appBloc = BlocProvider.of<AppBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    final Locale appLocale = Localizations.localeOf(context);
    changeStatusColor(whiteColor);
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: whiteColor),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/png/logo-nom.png",
                  height: 46,
                  width: 150,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 90,
              height: 90,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: widget.user!.imageProfil!.contains("http")
                    ? NetworkImage(widget.user!.imageProfil!)
                    : NetworkImage(apiUrl + widget.user!.imageProfil!),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(widget.user!.name!,
                style: const TextStyle(
                  fontFamily: 'OpenSans-Bold',
                  color: blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                )),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/svg/icon-icon-profile-settings.svg",
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  S.of(context).settings,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 12, fontFamily: "OpenSans", color: greyColor),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/svg/icon-icon-profile-infos.svg",
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  S.of(context).infos,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 12, fontFamily: "OpenSans", color: greyColor),
                )
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            InkWell(
              onTap: () {
                getIt<AuthBloc>().add(AuthLoggedOut());

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BlocProvider<AuthBloc>(
                        create: (context) =>
                            getIt<AuthBloc>()..add(AuthStarted()),
                        child: InitPage(
                          initialLink: widget.initialLink,
                        ),
                      );
                    },
                  ),
                  (Route<dynamic> route) => false,
                );
              },
              child: Container(
                  width: 130,
                  height: 35,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                          color: shadow1,
                          offset: Offset(0, 1),
                          blurRadius: 8,
                          spreadRadius: 0),
                      BoxShadow(
                          color: shadow2,
                          offset: Offset(0, 3),
                          blurRadius: 3,
                          spreadRadius: -2),
                      BoxShadow(
                          color: shadow3,
                          offset: Offset(0, 3),
                          blurRadius: 4,
                          spreadRadius: 0)
                    ],
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(S.of(context).logout,
                        style: TextStyle(
                          fontFamily: 'OpenSans-Bold',
                          color: whiteColor,
                          fontSize: textSize,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                  )),
            ),
            const Spacer(),
            appFooter(context, appLocale, _appBloc)
          ],
        ),
      ),
    );
  }
}
