import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:position/generated/l10n.dart';
import 'package:position/src/core/utils/colors.dart';
import 'package:position/src/core/utils/sizes.dart';
import 'package:position/src/core/utils/tools.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/modules/map/blocs/map/map_bloc.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/category.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/etablissements_model/datum.dart';
import 'package:position/src/modules/map/submodules/etablissements/models/type_commodites_model/types_commodite.dart';
import 'package:position/src/modules/map/widgets/drawer.dart';
import 'package:position/src/modules/map/widgets/searchbar.dart';
import 'package:position/src/modules/newetablishment/blocs/new_etablishment/new_etablishment_bloc.dart';
import 'package:position/src/modules/newetablishment/widgets/steps/step1.dart';
import 'package:position/src/modules/newetablishment/widgets/steps/step2.dart';
import 'package:position/src/modules/newetablishment/widgets/steps/step3.dart';
import 'package:position/src/modules/newetablishment/widgets/steps/step4.dart';
import 'package:position/src/modules/newetablishment/widgets/steps/step5.dart';

class NewEtablishment extends StatefulWidget {
  const NewEtablishment(
      {super.key,
      @required this.categories,
      @required this.user,
      @required this.initialLink,
      @required this.favoris,
      @required this.mapBloc,
      @required this.typesCommodites});
  final List<Category>? categories;
  final User? user;
  final PendingDynamicLinkData? initialLink;
  final List<Datum>? favoris;
  final MapBloc? mapBloc;
  final List<TypesCommodite>? typesCommodites;

  @override
  State<NewEtablishment> createState() => _NewEtablishmentState();
}

class _NewEtablishmentState extends State<NewEtablishment> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  NewEtablishmentBloc? _newEtablishmentBloc;
  int step = 0;

  @override
  void initState() {
    super.initState();
    _newEtablishmentBloc = BlocProvider.of<NewEtablishmentBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(whiteColor);
    return Scaffold(
      backgroundColor: whiteColor,
      key: scaffoldKey,
      body: SafeArea(
        child: BlocListener<NewEtablishmentBloc, NewEtablishmentState>(
          listener: (context, state) {
            if (state is StepTapped) {
              step = state.step;
            }
            if (state is StepContinue) {
              step = state.step;
            }
            if (state is StepCancelled) {
              step = state.step;
            }
          },
          child: BlocBuilder<NewEtablishmentBloc, NewEtablishmentState>(
            builder: (context, state) {
              final List<Step> steps = [
                Step(
                    title: const SizedBox(),
                    content: step1(
                        context, widget.categories!, _newEtablishmentBloc!),
                    isActive: step == 0 ? true : false,
                    state: step == 0 ? StepState.editing : StepState.indexed),
                Step(
                  title: const SizedBox(),
                  content: step2(context),
                  state: step == 1 ? StepState.editing : StepState.indexed,
                  isActive: step == 1 ? true : false,
                ),
                Step(
                  title: const SizedBox(),
                  content: step3(context),
                  isActive: step == 2 ? true : false,
                  state: step == 2 ? StepState.editing : StepState.indexed,
                ),
                Step(
                  title: const SizedBox(),
                  content: step4(context),
                  isActive: step == 3 ? true : false,
                  state: step == 3 ? StepState.editing : StepState.indexed,
                ),
                Step(
                  title: const SizedBox(),
                  content: step5(context, widget.typesCommodites),
                  isActive: step == 4 ? true : false,
                  state: step == 4 ? StepState.editing : StepState.indexed,
                ),
                Step(
                  title: const SizedBox(),
                  content: const Text("Hello World!"),
                  isActive: step == 5 ? true : false,
                  state: step == 5 ? StepState.editing : StepState.indexed,
                ),
                Step(
                  title: const SizedBox(),
                  content: const Text("Hello World!"),
                  state: StepState.complete,
                  isActive: step == 6 ? true : false,
                ),
              ];
              return Column(
                children: [
                  searchBar(context, widget.user!,
                      S.of(context).addEtablissement, "OpenSans-Bold", () {
                    scaffoldKey.currentState!.openDrawer();
                  }, () {}, widget.initialLink),
                  LinearProgressIndicator(
                    minHeight: 20,
                    value: (step + 1) / 7,
                    color: accentColor,
                    backgroundColor: grey2,
                  ),
                  Expanded(
                    child: Stepper(
                      elevation: 0,
                      controlsBuilder: ((context, details) {
                        return Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                highlightColor: transparent,
                                onTap: details.onStepCancel,
                                child: Text(S.of(context).cancel,
                                    style: TextStyle(
                                      fontFamily: 'OpenSans-Bold',
                                      color: primaryColor,
                                      fontSize: textSize,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    )),
                              ),
                              InkWell(
                                highlightColor: transparent,
                                onTap: details.onStepContinue,
                                child: Container(
                                    width: 130,
                                    height: 35,
                                    margin: const EdgeInsets.only(left: 30),
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
                                      child: Text(S.of(context).next,
                                          style: TextStyle(
                                            fontFamily: 'OpenSans-Bold',
                                            color: whiteColor,
                                            fontSize: textSize,
                                            fontWeight: FontWeight.w700,
                                            fontStyle: FontStyle.normal,
                                          )),
                                    )),
                              )
                            ],
                          ),
                        );
                      }),
                      physics: const ScrollPhysics(),
                      type: StepperType.horizontal,
                      currentStep: step,
                      steps: steps,
                      onStepTapped: (value) {
                        // _newEtablishmentBloc!.add(OnStepTapped(value));
                      },
                      onStepContinue: () {
                        _newEtablishmentBloc!.add(OnStepContinue(
                            step + 1 < _newEtablishmentBloc!.maxSteps!
                                ? step + 1
                                : 0));
                      },
                      onStepCancel: () {
                        _newEtablishmentBloc!
                            .add(OnStepCancelled(step - 1 >= 0 ? step - 1 : 0));
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      drawer: AppDrawer(
          mapBloc: widget.mapBloc, user: widget.user, favoris: widget.favoris),
    );
  }
}
