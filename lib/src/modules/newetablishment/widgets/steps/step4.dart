import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/sizes.dart';
import 'package:position/src/modules/newetablishment/blocs/new_etablishment/new_etablishment_bloc.dart';

Widget step4(BuildContext context) {
  TextEditingController websiteController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController whatsapp1Controller = TextEditingController();
  TextEditingController whatsapp2Controller = TextEditingController();
  return BlocListener<NewEtablishmentBloc, NewEtablishmentState>(
    listener: (context, state) {},
    child: BlocBuilder<NewEtablishmentBloc, NewEtablishmentState>(
      builder: (context, state) {
        return Container(
          color: whiteColor,
          child: Column(
            children: [
              Text(S.of(context).website,
                  style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: greyColor,
                    fontSize: textSize,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 40,
                margin: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: grey97,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextFormField(
                  controller: websiteController,
                  autovalidateMode: AutovalidateMode.always,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontFamily: "OpenSans", fontSize: textSize),
                  autocorrect: false,
                  cursorColor: primaryColor,
                  cursorHeight: 20,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: transparent)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: transparent),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(S.of(context).phone,
                  style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: greyColor,
                    fontSize: textSize,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 40,
                margin: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: grey97,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextFormField(
                  controller: phoneController,
                  autovalidateMode: AutovalidateMode.always,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontFamily: "OpenSans", fontSize: textSize),
                  autocorrect: false,
                  cursorColor: primaryColor,
                  cursorHeight: 20,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: transparent)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: transparent),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text("${S.of(context).whatsapp} 1",
                  style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: greyColor,
                    fontSize: textSize,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 40,
                margin: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: grey97,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextFormField(
                  controller: whatsapp1Controller,
                  autovalidateMode: AutovalidateMode.always,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontFamily: "OpenSans", fontSize: textSize),
                  autocorrect: false,
                  cursorColor: primaryColor,
                  cursorHeight: 20,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: transparent)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: transparent),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text("${S.of(context).whatsapp} 2",
                  style: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    color: greyColor,
                    fontSize: textSize,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 40,
                margin: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: grey97,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextFormField(
                  controller: whatsapp2Controller,
                  autovalidateMode: AutovalidateMode.always,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontFamily: "OpenSans", fontSize: textSize),
                  autocorrect: false,
                  cursorColor: primaryColor,
                  cursorHeight: 20,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: transparent)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: transparent),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
