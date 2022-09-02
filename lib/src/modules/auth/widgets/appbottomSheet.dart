// ignore_for_file: must_be_immutable, file_names

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/app/bloc/app_bloc.dart';
import 'package:position/src/core/utils/colors.dart';

class AppBottomSheet extends StatefulWidget {
  const AppBottomSheet({super.key});

  @override
  State<AppBottomSheet> createState() => _AppBottomSheetState();
}

class _AppBottomSheetState extends State<AppBottomSheet> {
  List<String> languagesItems = [
    'Français',
    'English',
  ];

  AppBloc? _appBloc;

  @override
  void initState() {
    super.initState();
    _appBloc = BlocProvider.of<AppBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 84,
      decoration: const BoxDecoration(color: accentColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 50,
          ),
          SizedBox(
            width: 220,
            child: DropdownButtonFormField2(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: whiteColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: whiteColor)),
              ),
              isExpanded: false,
              hint: Text(
                S.of(context).selectLanguage,
                style: const TextStyle(
                    fontSize: 14, color: whiteColor, fontFamily: "OpenSans"),
              ),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: whiteColor,
              ),
              iconSize: 30,
              buttonHeight: 50,
              buttonPadding: const EdgeInsets.only(left: 20, right: 10),
              dropdownDecoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(15),
              ),
              items: languagesItems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                              fontSize: 14,
                              color: whiteColor,
                              fontFamily: "OpenSans"),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return S.of(context).selectLanguage;
                }
                return null;
              },
              onChanged: (value) {
                if (value == "Français") {
                  _appBloc?.add(const ChangeLanguage(Locale("fr", "FR")));
                } else {
                  _appBloc?.add(const ChangeLanguage(Locale("en", "US")));
                }
              },
              onSaved: (value) {
                // selectedValue = value.toString();
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 50),
            child: SvgPicture.asset(
              "assets/images/svg/icon-help.svg",
              height: 30,
              width: 30,
            ),
          )
        ],
      ),
    );
  }
}
