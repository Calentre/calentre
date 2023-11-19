import 'package:equatable/equatable.dart';

class TimeDropDownState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RebuildTimeDropDownState extends TimeDropDownState {}

//-------

class TimeDropDownInitialState extends TimeDropDownState {
  final String value = "";
  @override
  List<Object?> get props => [value];
}

class TimeDropDownUpdatedState extends TimeDropDownState {
  TimeDropDownUpdatedState({required this.value});
  final String value;

  @override
  List<Object?> get props => [value];
}
