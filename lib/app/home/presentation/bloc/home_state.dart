class HomeViewStates {}

class InitialState extends HomeViewStates {
  final int viewIndex = 0;
}

class UpdateState extends HomeViewStates {
  final int? viewIndex;

  UpdateState(this.viewIndex);
}
