import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/modules/map/views/profile.dart';

Widget searchBar(
    BuildContext context,
    User user,
    String labelSearch,
    String fontFamily,
    VoidCallback callback,
    VoidCallback callbackSearch,
    PendingDynamicLinkData? initialLink) {
  return Card(
    elevation: 10,
    margin: EdgeInsets.zero,
    child: Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      color: whiteColor,
      child: Row(
        children: [
          InkWell(
            highlightColor: transparent,
            onTap: callback,
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              height: 20,
              width: 20,
              child: SvgPicture.asset("assets/images/svg/icon-menu.svg"),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            highlightColor: transparent,
            onTap: callbackSearch,
            child: Text(
              labelSearch,
              style: TextStyle(fontFamily: fontFamily, color: grey4),
            ),
          ),
          const Spacer(),
          const VerticalDivider(
            color: grey3,
          ),
          InkWell(
            highlightColor: transparent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProfilePage(
                      user: user,
                      initialLink: initialLink,
                    );
                  },
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 10),
              height: 20,
              width: 30,
              child:
                  SvgPicture.asset("assets/images/svg/icon-perm_identity.svg"),
            ),
          ),
        ],
      ),
    ),
  );
}
