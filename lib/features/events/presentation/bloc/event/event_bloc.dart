import 'package:calentre/config/constants/time_list.dart';
import 'package:calentre/config/enums/weekdays.dart';
import 'package:calentre/features/events/data/models/calentre_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_state.dart';
import 'package:calentre/features/events/presentation/helpers/add_new_time_field.dart';
import 'package:calentre/features/events/presentation/helpers/remove_extra_time_field.dart';
import 'package:calentre/features/events/presentation/helpers/validate_time_selection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalentreEventBloc
    extends Bloc<CalentreEventEvent, CalentreEventBaseState> {
  //initialize all states relating to the CalentreEvent Bloc
  final CalentreEventState _calentreEventState = CalentreEventState.initial();
  final DayScheduleValidationState _dayScheduleValidationState =
      DayScheduleValidationState.initial();
  //  final List<Map<WeekDays, List<bool>>> _errorList = [];

  CalentreEventBloc() : super(CalentreEventState.initial()) {
    on<UpdateCalentreEventDetailsEvent>(onUpdateFormFields);
    on<UpdateDayScheduleEvent>(onUpdateDaySchedule);
    on<UpdateDayScheduleValidationEvent>(onUpdateDayScheduleValidationState);
    on<AddNewTimeFieldEvent>(onAddNewTimeField);
    on<RemoveTimeFieldEvent>(onRemoveTimeField);
  }

  void onUpdateFormFields(UpdateCalentreEventDetailsEvent event,
      Emitter<CalentreEventBaseState> emit) {
    emit(_calentreEventState.clone(
        eventName: event.eventName, amount: event.amount));
  }

  void onUpdateDayScheduleValidationState(
      UpdateDayScheduleValidationEvent event,
      Emitter<CalentreEventBaseState> emit) {
    emit(_dayScheduleValidationState.clone(
      errorList: _dayScheduleValidationState.errorList,
    ));
  }

  void onAddNewTimeField(
      AddNewTimeFieldEvent event, Emitter<CalentreEventBaseState> emit) {
    addNewTimeFieldHelper(
        _calentreEventState, _dayScheduleValidationState, event);
  }

  void onRemoveTimeField(
      RemoveTimeFieldEvent event, Emitter<CalentreEventBaseState> emit) {
    removeNewTimeFieldHelper(
        _calentreEventState, _dayScheduleValidationState, event);
    print("Remove time field ${_calentreEventState.days}");
    print("Remove time field ${_dayScheduleValidationState.errorList}");
  }

  void onUpdateDaySchedule(
      UpdateDayScheduleEvent event, Emitter<CalentreEventBaseState> emit) {
    //check if the state has error
    //if error emit DayScheduleValidationState
    // if !error
    //case switch the day of the week, and then clone the _calentreBloc with the correct response
    // List<TimeSlot> mondaySchedule = [..._calentreEventState.days.monday!];
    // List<TimeSlot> tuesdaySchedule = [..._calentreEventState.days.tuesday!];
    // List<TimeSlot> wednesdaySchedule = _calentreEventState.days.wednesday!;
    // List<TimeSlot>? thursdaySchedule = _calentreEventState.days.thursday!;
    // List<TimeSlot>? fridaySchedule = _calentreEventState.days.friday!;
    // List<TimeSlot>? saturdaySchedule = _calentreEventState.days.saturday!;
    // List<TimeSlot>? sundaySchedule = _calentreEventState.days.sunday;

    print("startTime ${event.startTime}");
    print("EndTime ${event.endTime}");
    final hasError = validateTimeSelection(
        day: event.day,
        startTime: event.startTime,
        endTime: event.endTime,
        index: event.index);

    // switch (event.day) {
    //   case WeekDays.monday:
    //     mondaySchedule.insert(
    //         event.index, TimeSlot(start: event.startTime, end: event.endTime));
    //     final updatedList = List<TimeSlot>.from(mondaySchedule);
    //     emit(_calentreEventState.clone(days: Days(monday: updatedList)));
    //     break;
    //   case WeekDays.tuesday:
    //     tuesdaySchedule.insert(
    //         event.index, TimeSlot(start: event.startTime, end: event.endTime));
    //     break;
    //   default:
    // }
    print("Has error is ${hasError}");

    // if (hasError) {
    switch (event.day) {
      case WeekDays.monday:
        List<Map<WeekDays, List<bool>>> _errorList = [
          ..._dayScheduleValidationState.errorList
        ];

        if (hasError) {
          //used to expand the errorlist to avoid rangError

          _errorList[0][WeekDays.monday]?[event.index] = true;
          // _dayScheduleValidationState.errorList[0][WeekDays.monday]!.add(false);
          // _dayScheduleValidationState.errorList[0]
          //     [WeekDays.monday]![event.index] = true;
          print(
              "Emitted state shoudl be ${_dayScheduleValidationState.errorList}");
          emit(_dayScheduleValidationState.clone(
            message: "Start Time must be less than End Time",
            index: event.index,
            day: event.day,
            errorList: _errorList,
          ));
        } else {
          //update the day schedule here and emit the neccessary states
          //set the error list to false
          _errorList[0][WeekDays.monday]?[event.index] = false;
          print(
              "Emitted state shoudl be ${_dayScheduleValidationState.errorList}");
          // _dayScheduleValidationState.errorList[0]
          //     [WeekDays.monday]![event.index] = false;
          emit(UpdateDayScheduleState(
              index: event.index,
              day: event.day,
              errorList: _errorList)); //remove errorList
          emit(_dayScheduleValidationState.clone());
        }

        break;
      case WeekDays.tuesday:
        // _dayScheduleValidationState.errorList[1]
        //     [WeekDays.tuesday]![event.index] = true;

        emit(_dayScheduleValidationState.clone(
          message: "Start Time must be less than End Time",
          index: event.index,
          day: event.day,
          errorList: _dayScheduleValidationState.errorList,
        ));
        break;
      default:
    }
    // }

    //to delete now
    //  else {
    //   // _dayScheduleValidationState.errorList[0][WeekDays.monday]![event.index] =
    //   //     false;
    //   print("Emitted without error ${_dayScheduleValidationState.errorList}");
    //   emit(UpdateDayScheduleState(
    //       index: event.index,
    //       day: event.day,
    //       errorList: _dayScheduleValidationState.errorList));
    //   emit(_dayScheduleValidationState.clone());
    // }

    // state.
  }
}
