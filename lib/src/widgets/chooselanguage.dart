import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:position/src/core/app/bloc/app_bloc.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/sizes.dart';

Widget chooseLanguage(Locale appLocale, AppBloc? appBloc) {
  List<String> languagesItems = [
    'Français',
    'English',
  ];
  return SizedBox(
    width: 150,
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
        appLocale.languageCode == "fr" ? languagesItems[0] : languagesItems[1],
        style: TextStyle(
            fontSize: textSize, color: whiteColor, fontFamily: "OpenSans"),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: whiteColor,
        ),
        iconSize: 30,
      ),
      buttonStyleData: const ButtonStyleData(
        height: 40,
        padding: EdgeInsets.only(left: 20, right: 10),
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      items: languagesItems
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                      fontSize: textSize,
                      color: whiteColor,
                      fontFamily: "OpenSans"),
                ),
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return appLocale.languageCode == "fr"
              ? languagesItems[0]
              : languagesItems[1];
        }
        return null;
      },
      onChanged: (value) {
        if (value == "Français") {
          appBloc?.add(const ChangeLanguage(Locale("fr", "FR")));
        } else {
          appBloc?.add(const ChangeLanguage(Locale("en", "US")));
        }
      },
      onSaved: (value) {
        // selectedValue = value.toString();
      },
    ),
  );
}
