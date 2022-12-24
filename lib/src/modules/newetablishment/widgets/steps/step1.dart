import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/sizes.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/category.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/sous_category.dart';
import 'package:position/src/modules/newetablishment/blocs/new_etablishment/new_etablishment_bloc.dart';

Widget step1(BuildContext context, List<Category> categories,
    NewEtablishmentBloc newEtablishmentBloc) {
  List<SousCategory> souscategories = [];
  TextEditingController etablissementNameController = TextEditingController();
  SousCategory? sousCategorySelect;
  bool categorieSelect = false;
  return BlocListener<NewEtablishmentBloc, NewEtablishmentState>(
    listener: (context, state) {
      if (state is CategorieSelected) {
        souscategories = state.category.sousCategories!;
        categorieSelect = true;
      }
      if (state is StepCancelled) {
        etablissementNameController.text = "";
        sousCategorySelect = null;
        souscategories = [];
        categorieSelect = false;
      }
      if (state is StepContinue) {}
    },
    child: BlocBuilder<NewEtablishmentBloc, NewEtablishmentState>(
      builder: (context, state) {
        return Container(
          color: whiteColor,
          child: Column(
            children: [
              Text(S.of(context).etablissement_name,
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
                  controller: etablissementNameController,
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
              Text(S.of(context).category,
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
                child: DropdownButtonFormField2(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: grey97)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(color: grey97)),
                  ),
                  isExpanded: false,
                  hint: Text(
                    S.of(context).choose_category,
                    style: TextStyle(
                        fontSize: textSize,
                        color: blackColor,
                        fontFamily: "OpenSans"),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: greyColor,
                  ),
                  iconSize: 20,
                  buttonHeight: 40,
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  items: categories
                      .map((item) => DropdownMenuItem<Category>(
                            value: item,
                            child: Text(
                              item.shortname!,
                              style: TextStyle(
                                  fontSize: textSize,
                                  color: blackColor,
                                  fontFamily: "OpenSans"),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    return null;
                  },
                  onChanged: (value) {
                    newEtablishmentBloc.add(SelectCategorie(value!));
                  },
                  onSaved: (value) {
                    // selectedValue = value.toString();
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              categorieSelect == true
                  ? Text(S.of(context).subcategory,
                      style: TextStyle(
                        fontFamily: 'OpenSans-Bold',
                        color: greyColor,
                        fontSize: textSize,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ))
                  : const SizedBox(),
              const SizedBox(
                height: 8,
              ),
              categorieSelect == true
                  ? Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                        left: 50,
                      ),
                      child: DropdownButtonFormField2(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: const BorderSide(color: grey97)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: const BorderSide(color: grey97)),
                        ),
                        isExpanded: false,
                        hint: Text(
                          S.of(context).choose_sub_category,
                          style: TextStyle(
                              fontSize: textSize,
                              color: blackColor,
                              fontFamily: "OpenSans"),
                        ),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: greyColor,
                        ),
                        iconSize: 20,
                        buttonHeight: 40,
                        buttonPadding:
                            const EdgeInsets.only(left: 20, right: 10),
                        dropdownDecoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        items: souscategories
                            .map((item) => DropdownMenuItem<SousCategory>(
                                  value: item,
                                  child: Text(
                                    item.nom!.split('-')[0],
                                    style: TextStyle(
                                        fontSize: textSize - 2,
                                        color: blackColor,
                                        fontFamily: "OpenSans"),
                                  ),
                                ))
                            .toList(),
                        validator: (value) {
                          return null;
                        },
                        onChanged: (value) {
                          sousCategorySelect = value!;
                        },
                        onSaved: (value) {
                          // selectedValue = value.toString();
                        },
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(S.of(context).terms,
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      color: greyColor,
                      fontSize: textSize,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              )
            ],
          ),
        );
      },
    ),
  );
}
