// import 'package:calentre/features/events/data/models/calentre_event.dart';
import 'package:calentre/features/events/data/models/calentre_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_state.dart';
import 'package:calentre/features/events/presentation/helpers/add_new_time_field.dart';
import 'package:calentre/features/events/presentation/helpers/remove_extra_time_field.dart';
import 'package:calentre/features/events/presentation/helpers/update_current_day_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///This bloc was designed to have a [CalentreEventBaseState] with no concrete
///properties. So we have to initialize our states that extends [CalentreEventBaseState]
///as private instances within this bloc class. This means we have to constantly update the private
///instances from inside the event handlers, to ensure it is always up-to date with data
///from different events or state changes. Not the best approach, and needs refactor in future
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
    on<CreateCalentreEventEvent>(onCreateCalentreEvent);
  }

  void onUpdateFormFields(UpdateCalentreEventDetailsEvent event,
      Emitter<CalentreEventBaseState> emit) {
    final newState = _calentreEventState.clone(
      _calentreEventState,
      eventName: event.eventName,
      eventDescription: event.eventDescription,
      platformType: event.platformType,
      duration: event.duration,
      eventLink: event.eventLink,
      eventType: event.eventType,
      amount: event.amount,
    );
    _calentreEventState = newState;
    emit(newState);

    //update the calentreEventState
  }

  ///TO BE REMOVED
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
    emit(_dayScheduleValidationState.clone(
        _dayScheduleValidationState)); //controls error display on the setAvailability form fields
  }

  void onCreateCalentreEvent(
      CreateCalentreEventEvent event, Emitter<CalentreEventBaseState> emit) {
    //call appi endpoint to create here
    final toServer = CalentreEvent(
            eventName: _calentreEventState.eventName,
            eventDescription: _calentreEventState.eventDescription,
            platformType: _calentreEventState.platformType,
            duration: _calentreEventState.duration,
            eventLink: _calentreEventState.eventLink,
            eventType: _calentreEventState.eventType,
            amount: _calentreEventState.amount,
            days: _calentreEventState.days)
        .toJson();
    print("Event object is $toServer");
  }
}

//Delete UpdatedDayScheduleState
