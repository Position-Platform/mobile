// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/src/core/app/bloc/app_bloc.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/widgets/chooselanguage.dart';

class AppBottomSheet extends StatefulWidget {
  const AppBottomSheet({super.key});

  @override
  State<AppBottomSheet> createState() => _AppBottomSheetState();
}

class _AppBottomSheetState extends State<AppBottomSheet> {
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
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 64,
      decoration: const BoxDecoration(color: accentColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 50,
          ),
          chooseLanguage(appLocale, _appBloc),
          Container(
            margin: const EdgeInsets.only(left: 50),
            child: SvgPicture.asset(
              "assets/images/svg/icon-help.svg",
              height: 20,
              width: 20,
            ),
          )
        ],
      ),
    );
  }
}
