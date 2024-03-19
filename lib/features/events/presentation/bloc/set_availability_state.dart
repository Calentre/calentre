import 'package:calentre/config/enums/weekdays.dart';
import 'package:equatable/equatable.dart';

class SetAvailabilityStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class ExtraTimeFieldInitialState extends SetAvailabilityStates {
  ///This value assumes the length of the List (array) that controls the
  ///generation of the extra time field.
  final int listLength = 0;

  @override
  List<Object> get props => [listLength];
}

class ExtraTimeFieldUpdatedState extends SetAvailabilityStates {
  ///This value assumes the length of the List (array) that controls the
  ///generation of the extra time field.
  final int listLength;

  ExtraTimeFieldUpdatedState(this.listLength);

  @override
  List<Object> get props => [listLength];
}

class CheckBoxInitialState extends SetAvailabilityStates {
  final bool state = true;

  @override
  List<Object> get props => [state];
}

class CheckBoxUpdatedState extends SetAvailabilityStates {
  final bool state;

  CheckBoxUpdatedState(this.state);

  @override
  List<Object> get props => [state];
}

class RebuildSetAvailabilityScreenState extends SetAvailabilityStates {
  final int state;

  RebuildSetAvailabilityScreenState(this.state);

  @override
  List<Object> get props => [state];
}
