import 'package:equatable/equatable.dart';

class HomeViewStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends HomeViewStates {
  @override
  List<Object?> get props => [];
}

class UpdateState extends HomeViewStates {
  final int? viewIndex;

  UpdateState(this.viewIndex);
  @override
  List<Object?> get props => [viewIndex];
}
