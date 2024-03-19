import 'package:calentre/config/enums/weekdays.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_event.dart';
import 'package:calentre/features/events/presentation/bloc/set_availability_event.dart';
import 'package:calentre/features/events/presentation/bloc/set_availability_state.dart';
import 'package:calentre/features/events/presentation/helpers/validate_time_selection.dart';
import 'package:calentre/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///Handles all availability.
///Each day of the week uses a unique instance of the [SetAvailablityBloc]
class SetAvailabilityBloc
    extends Bloc<SetAvailabilityEvents, SetAvailabilityStates> {
  final _calentreEventBloc = sl.get<CalentreEventBloc>();
  int listLength = 0;
  bool checkBoxState = true;

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

  //otherwise, emit nothing & and update calentreEventBloc
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
