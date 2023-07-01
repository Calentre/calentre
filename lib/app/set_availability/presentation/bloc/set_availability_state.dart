import 'package:equatable/equatable.dart';

class SetAvailabilityStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class ExtraTimeFieldInitialState extends SetAvailabilityStates {
  ///This value assumes the length of the List (array) that controls the
  ///generation of the extra time field.
  final double listLength = 0;

  @override
  List<Object> get props => [listLength];
}

class ExtraTimeFieldUpdatedState extends SetAvailabilityStates {
  ///This value assumes the length of the List (array) that controls the
  ///generation of the extra time field.
  final double listLength;

  ExtraTimeFieldUpdatedState(this.listLength);

  @override
  List<Object> get props => [listLength];
}
