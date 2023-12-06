import 'package:calentre/features/events/presentation/bloc/event/event_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/set_availability_event.dart';
import 'package:calentre/features/events/presentation/bloc/set_availability_state.dart';
import 'package:calentre/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetAvailabilityBloc
    extends Bloc<SetAvailabilityEvents, SetAvailabilityStates> {
  int listLength = 0;
  bool checkBoxState = true;
  List isTimeErrorList = [];

  SetAvailabilityBloc() : super(ExtraTimeFieldInitialState()) {
    on<AddExtraTimeFieldEvent>(onClickAddExtraTimeField);
    on<RemoveExtraTimeFieldEvent>(onClickRemoveExtraTimeField);
    on<CheckBoxEvent>(onClickCheckBox);
    on<RebuildSetAvailabilityScreenEvent>(onTriggerRebuild);
  }

  void onClickAddExtraTimeField(
      AddExtraTimeFieldEvent event, Emitter<SetAvailabilityStates> emit) {
    listLength++;
    emit(ExtraTimeFieldUpdatedState(listLength));
  }

  void onClickRemoveExtraTimeField(
      RemoveExtraTimeFieldEvent event, Emitter<SetAvailabilityStates> emit) {
    if (listLength > 0) {
      listLength--;
      emit(ExtraTimeFieldUpdatedState(listLength));
    }
  }

  void onClickCheckBox(
      CheckBoxEvent event, Emitter<SetAvailabilityStates> emit) {
    checkBoxState = !checkBoxState;
    emit(CheckBoxUpdatedState(checkBoxState));
  }

  void onTriggerRebuild(
      SetAvailabilityEvents event, Emitter<SetAvailabilityStates> emit) {
    int rebuildCounter = sl.get<CalentreEventBloc>().rebuildCounter;
    // List<Map<String, List<bool>>> isTimeErrorList =
    //     sl.get<CalentreEventBloc>().errorList;
    // bool isTimeError = sl.get<CalentreEventBloc>().isTimeError;r
    emit(RebuildSetAvailabilityScreenState(rebuildCounter));
    // emit(RebuildSetAvailabilityScreenState(isTimeError));
  }
}
