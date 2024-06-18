import 'package:calentre/features/events/data/models/calentre_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_state.dart';
import 'package:calentre/features/events/presentation/helpers/add_new_time_field.dart';
import 'package:calentre/features/events/presentation/helpers/remove_extra_time_field.dart';
import 'package:calentre/features/events/presentation/helpers/update_current_day_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalentreEventBloc
    extends Bloc<CalentreEventEvent, CalentreEventBaseState> {
  //initialize all states relating to the CalentreEvent Bloc
  CalentreEventState _calentreEventState = CalentreEventState.initial();
  DayScheduleValidationState _dayScheduleValidationState =
      DayScheduleValidationState.initial();

  CalentreEventBloc() : super(CalentreEventState.initial()) {
    on<UpdateCalentreEventDetailsEvent>(onUpdateFormFields);
    on<UpdateDayScheduleEvent>(onUpdateDaySchedule);
    on<UpdateDayScheduleValidationEvent>(onUpdateDayScheduleValidationState);
    on<AddNewTimeFieldEvent>(onAddNewTimeField);
    on<RemoveTimeFieldEvent>(onRemoveTimeField);
  }

  void onUpdateFormFields(UpdateCalentreEventDetailsEvent event,
      Emitter<CalentreEventBaseState> emit) {
    emit(_calentreEventState.clone(_calentreEventState,
        eventName: event.eventName, amount: event.amount));
  }

  ///
  void onUpdateDayScheduleValidationState(
      UpdateDayScheduleValidationEvent event,
      Emitter<CalentreEventBaseState> emit) {
    emit(_dayScheduleValidationState.clone(
      _dayScheduleValidationState,
      errorList: _dayScheduleValidationState.errorList,
    ));
  }

  ///initializes each of the week with a default [TimeSlot]
  void onAddNewTimeField(
      AddNewTimeFieldEvent event, Emitter<CalentreEventBaseState> emit) {
    final states = addNewTimeFieldHelper(
        _calentreEventState, _dayScheduleValidationState, event);
    _calentreEventState = states[0];
    _dayScheduleValidationState = states[1];
  }

  void onRemoveTimeField(
      RemoveTimeFieldEvent event, Emitter<CalentreEventBaseState> emit) {
    final states = removeNewTimeFieldHelper(
        _calentreEventState, _dayScheduleValidationState, event);
    _calentreEventState = states[0];
    _dayScheduleValidationState = states[1];
  }

  void onUpdateDaySchedule(
      UpdateDayScheduleEvent event, Emitter<CalentreEventBaseState> emit) {
    final states = updateCurrentDayDetailsHelper(
        _calentreEventState, _dayScheduleValidationState, event);
    _calentreEventState = states[0];
    _dayScheduleValidationState = states[1];
    emit(_calentreEventState);
    emit(_dayScheduleValidationState.clone(_dayScheduleValidationState));
  }
}


//Delete UpdatedDayScheduleState
