import 'package:equatable/equatable.dart';

class FormDropDownState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FormDropDownInitialState extends FormDropDownState {
  final String value = "";
  @override
  List<Object?> get props => [value];
}

class FormDropDownUpdatedState extends FormDropDownState {
  FormDropDownUpdatedState({required this.value});
  final String value;

  @override
  List<Object?> get props => [value];
}

class RebuildDropDownState extends FormDropDownState {}
