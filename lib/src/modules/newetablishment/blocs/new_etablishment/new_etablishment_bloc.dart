import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:position/src/modules/map/submodules/categories/models/categories_model/category.dart';

part 'new_etablishment_event.dart';
part 'new_etablishment_state.dart';

class NewEtablishmentBloc
    extends Bloc<NewEtablishmentEvent, NewEtablishmentState> {
  final int? maxSteps;
  NewEtablishmentBloc({@required this.maxSteps})
      : super(NewEtablishmentInitial(0, maxSteps!)) {
    on<OnStepTapped>(_onStepTapped);
    on<OnStepCancelled>(_onStepCancelled);
    on<OnStepContinue>(_onStepContinue);
    on<SelectCategorie>(_selectCategorie);
  }

  _onStepTapped(OnStepTapped event, Emitter<NewEtablishmentState> emit) async {
    emit(StepTapped(event.step));
  }

  _onStepCancelled(
      OnStepCancelled event, Emitter<NewEtablishmentState> emit) async {
    emit(StepCancelled(event.step));
  }

  _onStepContinue(
      OnStepContinue event, Emitter<NewEtablishmentState> emit) async {
    emit(StepContinue(event.step));
  }

  _selectCategorie(SelectCategorie event, Emitter<NewEtablishmentState> emit) {
    emit(CategorieSelected(event.category));
  }
}
