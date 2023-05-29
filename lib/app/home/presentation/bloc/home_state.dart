class HomeViewStates {}

class InitialState extends HomeViewStates {}

class UpdateState extends HomeViewStates {
  final int? viewIndex;

  UpdateState(this.viewIndex);
}
