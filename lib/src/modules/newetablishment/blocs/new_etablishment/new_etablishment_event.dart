part of 'new_etablishment_bloc.dart';

abstract class NewEtablishmentEvent extends Equatable {
  const NewEtablishmentEvent();

  @override
  List<Object> get props => [];
}

class OnStepTapped extends NewEtablishmentEvent {
  final int step;

  const OnStepTapped(this.step);
  @override
  List<Object> get props => [step];

  @override
  String toString() => 'OnStepTapped { step: $step }';
}

class OnStepCancelled extends NewEtablishmentEvent {
  final int step;

  const OnStepCancelled(this.step);
  @override
  List<Object> get props => [step];

  @override
  String toString() => 'OnStepCancelled { step: $step }';
}

class OnStepContinue extends NewEtablishmentEvent {
  final int step;

  const OnStepContinue(this.step);
  @override
  List<Object> get props => [step];

  @override
  String toString() => 'OnStepContinue { step: $step }';
}

class SelectCategorie extends NewEtablishmentEvent {
  final Category category;

  const SelectCategorie(this.category);
  @override
  List<Object> get props => [category];

  @override
  String toString() => 'SelectCategorie { category: $category }';
}
