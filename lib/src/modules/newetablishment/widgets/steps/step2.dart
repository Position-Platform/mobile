import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/sizes.dart';
import 'package:position/src/modules/newetablishment/blocs/new_etablishment/new_etablishment_bloc.dart';

Widget step2(BuildContext context) {
  TextEditingController descriptionController = TextEditingController();
  return BlocListener<NewEtablishmentBloc, NewEtablishmentState>(
    listener: (context, state) {},
    child: BlocBuilder<NewEtablishmentBloc, NewEtablishmentState>(
      builder: (context, state) {
        return Container(
          color: whiteColor,
          child: Column(
            children: [
              Text(S.of(context).description,
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
                height: 200,
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
                  maxLines: null,
                  minLines: null,
                  expands: true,
                  controller: descriptionController,
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
            ],
          ),
        );
      },
    ),
  );
}
