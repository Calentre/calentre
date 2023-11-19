import 'package:calentre/features/events/presentation/bloc/time_drop_down_event.dart';
import 'package:calentre/features/events/presentation/bloc/time_drop_down_state.dart';
import 'package:calentre/shared/form_drop_down/bloc/form_drop_down_bloc.dart';
import 'package:calentre/shared/form_drop_down/bloc/form_drop_down_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeDropDownBloc extends Bloc<TimeDropDownEvent, TimeDropDownState> {
  TimeDropDownBloc() : super(TimeDropDownState()) {
    on<SelectTimeDropDownValueEvent>(onClickDropDownItem);
    on<RebuildTimeDropDownEvent>(onTriggerRebuild);
  }
  String dropDownValue = "";

  void onClickDropDownItem(SelectTimeDropDownValueEvent event,
      Emitter<TimeDropDownState> emit) async {
    emit(TimeDropDownUpdatedState(value: dropDownValue));
  }

  void onTriggerRebuild(
      RebuildTimeDropDownEvent event, Emitter<TimeDropDownState> emit) {
    print("FormDropDownBloc rebuild triggered");
    emit(RebuildTimeDropDownState());
  }
}
