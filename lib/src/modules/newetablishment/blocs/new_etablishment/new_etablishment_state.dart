part of 'new_etablishment_bloc.dart';

abstract class NewEtablishmentState extends Equatable {
  const NewEtablishmentState();

  @override
  List<Object> get props => [];
}

class NewEtablishmentInitial extends NewEtablishmentState {
  final int step;
  final int maxStep;

  const NewEtablishmentInitial(this.step, this.maxStep);
  @override
  List<Object> get props => [step, maxStep];

  @override
  String toString() =>
      'NewEtablishmentInitial { step: $step, maxStep : $maxStep }';
}

class StepTapped extends NewEtablishmentState {
  final int step;

  const StepTapped(this.step);
  @override
  List<Object> get props => [step];

  @override
  String toString() => 'OnStepTapped { step: $step }';
}

class StepCancelled extends NewEtablishmentState {
  final int step;

  const StepCancelled(this.step);
  @override
  List<Object> get props => [step];

  @override
  String toString() => 'StepCancelled { step: $step }';
}

class StepContinue extends NewEtablishmentState {
  final int step;

  const StepContinue(this.step);
  @override
  List<Object> get props => [step];

  @override
  String toString() => 'StepContinue { step: $step }';
}

class CategorieSelected extends NewEtablishmentState {
  final Category category;

  const CategorieSelected(this.category);
  @override
  List<Object> get props => [category];

  @override
  String toString() => 'CategorieSelected { category: $category }';
}
