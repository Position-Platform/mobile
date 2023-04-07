import 'package:flutter/material.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/sizes.dart';
import 'package:position/src/modules/newetablishment/models/chipsmodel.dart';

Widget step6(BuildContext context) {
  TextEditingController serviceController = TextEditingController();
  final List<ChipsModel> services = [];
  return Column(
    children: [
      Container(
        height: 40,
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: grey97,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: TextFormField(
          controller: serviceController,
          autovalidateMode: AutovalidateMode.always,
          keyboardType: TextInputType.text,
          autocorrect: false,
          cursorColor: primaryColor,
          cursorHeight: 20,
          style: TextStyle(fontFamily: "OpenSans", fontSize: textSize),
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: transparent)),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: transparent),
            ),
            suffixIcon: InkWell(
              highlightColor: transparent,
              onTap: () {
                services.add(ChipsModel(
                    id: DateTime.now().toString(),
                    name: serviceController.text));
                serviceController.clear();
              },
              child: Container(
                  width: 70,
                  height: 5,
                  margin: const EdgeInsets.only(right: 5, top: 5, bottom: 5),
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
                    child: Text(S.of(context).add,
                        style: TextStyle(
                          fontFamily: 'OpenSans-Bold',
                          color: whiteColor,
                          fontSize: textSize,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                  )),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      Wrap(
        spacing: 10,
        children: services
            .map((e) => Chip(
                  backgroundColor: primaryColor,
                  labelStyle: const TextStyle(
                    color: whiteColor,
                    fontFamily: 'OpenSans',
                  ),
                  label: Text(e.name),
                  onDeleted: () {
                    services.remove(e);
                  },
                ))
            .toList(),
      ),
    ],
  );
}
