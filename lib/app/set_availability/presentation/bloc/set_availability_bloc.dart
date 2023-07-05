import 'package:calentre/app/set_availability/presentation/bloc/set_availability_event.dart';
import 'package:calentre/app/set_availability/presentation/bloc/set_availability_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetAvailabilityBloc
    extends Bloc<SetAvailabilityEvents, SetAvailabilityStates> {
  int listLength = 0;
  bool checkBoxState = true;

  SetAvailabilityBloc() : super(ExtraTimeFieldInitialState()) {
    on<AddExtraTimeFieldEvent>(onClickAddExtraTimeField);
    on<RemoveExtraTimeFieldEvent>(onClickRemoveExtraTimeField);
    on<CheckBoxEvent>(onClickCheckBox);
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
}
