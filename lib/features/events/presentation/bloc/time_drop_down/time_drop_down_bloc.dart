import 'package:calentre/features/events/presentation/bloc/time_drop_down/time_drop_down_event.dart';
import 'package:calentre/features/events/presentation/bloc/time_drop_down/time_drop_down_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeDropDownBloc extends Bloc<TimeDropDownEvent, TimeDropDownState> {
  TimeDropDownBloc() : super(TimeDropDownState()) {
    on<SelectTimeDropDownValueEvent>(onClickDropDownItem);
    on<RebuildTimeDropDownEvent>(onTriggerRebuild);
  }
  String dropDownValue = "";
  bool isTimeError = false;

  void onClickDropDownItem(SelectTimeDropDownValueEvent event,
      Emitter<TimeDropDownState> emit) async {
    emit(TimeDropDownUpdatedState(value: dropDownValue));
  }

  void onTriggerRebuild(
      RebuildTimeDropDownEvent event, Emitter<TimeDropDownState> emit) {
    emit(RebuildTimeDropDownState());
  }
}
