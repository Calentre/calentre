import 'package:equatable/equatable.dart';

class SetAvailabilityStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class ExtraTimeFieldInitialState extends Equatable {
  //This value assumes the length of the List (array) that controls the extra time field.
  final double listLength = 0;

  @override
  List<Object> get props => [listLength];
}
