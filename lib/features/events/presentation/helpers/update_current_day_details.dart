import 'package:calentre/config/enums/weekdays.dart';
import 'package:calentre/features/events/data/models/calentre_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_state.dart';
import 'package:calentre/features/events/presentation/helpers/validate_time_selection.dart';

///Updates the state of `startTime` and `endTime` from the dropdown field on the scheduler, to the `CalentreEventBloc`.
List updateCurrentDayDetailsHelper(
    CalentreEventState calentreEventState,
    DayScheduleValidationState dayScheduleValidationState,
    UpdateDayScheduleEvent event) {
  //Create a new list from the current day states
  List<TimeSlot> mondaySchedule = [...calentreEventState.days.monday!];
  List<TimeSlot> tuesdaySchedule = [...calentreEventState.days.tuesday!];
  List<TimeSlot> wednesdaySchedule = [...calentreEventState.days.wednesday!];
  List<TimeSlot> thursdaySchedule = [...calentreEventState.days.thursday!];
  List<TimeSlot> fridaySchedule = [...calentreEventState.days.friday!];
  List<TimeSlot> saturdaySchedule = [...calentreEventState.days.saturday!];
  List<TimeSlot> sundaySchedule = [...calentreEventState.days.sunday!];

  //Create a new error list from from the current state
  List<Map<WeekDays, List<bool>>> errorList = [
    ...dayScheduleValidationState.errorList
  ];

  //Create a new object with the updated days schedule
  final updatedDays = Days(
      monday: mondaySchedule,
      tuesday: tuesdaySchedule,
      wednesday: wednesdaySchedule,
      thursday: thursdaySchedule,
      friday: fridaySchedule,
      saturday: saturdaySchedule,
      sunday: sundaySchedule);

  //set startTime and EndTime from the drop down
  final String startTime =
      event.startTime ?? calentreEventState.days.monday![event.index].start!;
  final String endTime =
      event.endTime ?? calentreEventState.days.monday![event.index].end!;

//Check if the current time selection has an error
  final hasError = validateTimeSelection(
      day: event.day,
      startTime: startTime,
      endTime: endTime,
      index: event.index);

  switch (event.day) {
    case WeekDays.monday:
      if (hasError) {
        errorList[0][WeekDays.monday]![event.index] = true;

        dayScheduleValidationState = dayScheduleValidationState.clone(
          dayScheduleValidationState,
          message: "Start Time must be less than End Time",
          index: event.index,
          day: event.day,
          errorList: errorList,
        );
      } else {
        errorList[0][WeekDays.monday]![event.index] = false;

        dayScheduleValidationState = dayScheduleValidationState
            .clone(dayScheduleValidationState, errorList: errorList);
      }
      mondaySchedule[event.index] = TimeSlot(start: startTime, end: endTime);
      calentreEventState =
          calentreEventState.clone(calentreEventState, days: updatedDays);
      return [calentreEventState, dayScheduleValidationState];

    case WeekDays.tuesday:
      if (hasError) {
        errorList[1][WeekDays.tuesday]![event.index] = true;

        dayScheduleValidationState = dayScheduleValidationState.clone(
          dayScheduleValidationState,
          message: "Start Time must be less than End Time",
          index: event.index,
          day: event.day,
          errorList: errorList,
        );
      } else {
        errorList[1][WeekDays.tuesday]![event.index] = false;

        dayScheduleValidationState = dayScheduleValidationState
            .clone(dayScheduleValidationState, errorList: errorList);
      }
      tuesdaySchedule[event.index] = TimeSlot(start: startTime, end: endTime);
      calentreEventState =
          calentreEventState.clone(calentreEventState, days: updatedDays);
      return [calentreEventState, dayScheduleValidationState];
    case WeekDays.wednesday:
      if (hasError) {
        errorList[2][WeekDays.wednesday]![event.index] = true;

        dayScheduleValidationState = dayScheduleValidationState.clone(
          dayScheduleValidationState,
          message: "Start Time must be less than End Time",
          index: event.index,
          day: event.day,
          errorList: errorList,
        );
      } else {
        errorList[2][WeekDays.wednesday]![event.index] = false;

        dayScheduleValidationState = dayScheduleValidationState
            .clone(dayScheduleValidationState, errorList: errorList);
      }
      wednesdaySchedule[event.index] = TimeSlot(start: startTime, end: endTime);
      calentreEventState =
          calentreEventState.clone(calentreEventState, days: updatedDays);
      return [calentreEventState, dayScheduleValidationState];
    case WeekDays.thursday:
      if (hasError) {
        errorList[3][WeekDays.thursday]![event.index] = true;

        dayScheduleValidationState = dayScheduleValidationState.clone(
          dayScheduleValidationState,
          message: "Start Time must be less than End Time",
          index: event.index,
          day: event.day,
          errorList: errorList,
        );
      } else {
        errorList[3][WeekDays.thursday]![event.index] = false;

        dayScheduleValidationState = dayScheduleValidationState
            .clone(dayScheduleValidationState, errorList: errorList);
      }
      thursdaySchedule[event.index] = TimeSlot(start: startTime, end: endTime);
      calentreEventState =
          calentreEventState.clone(calentreEventState, days: updatedDays);
      return [calentreEventState, dayScheduleValidationState];
    case WeekDays.friday:
      if (hasError) {
        errorList[4][WeekDays.friday]![event.index] = true;

        dayScheduleValidationState = dayScheduleValidationState.clone(
          dayScheduleValidationState,
          message: "Start Time must be less than End Time",
          index: event.index,
          day: event.day,
          errorList: errorList,
        );
      } else {
        errorList[4][WeekDays.friday]![event.index] = false;

        dayScheduleValidationState = dayScheduleValidationState
            .clone(dayScheduleValidationState, errorList: errorList);
      }
      fridaySchedule[event.index] = TimeSlot(start: startTime, end: endTime);
      calentreEventState =
          calentreEventState.clone(calentreEventState, days: updatedDays);
      return [calentreEventState, dayScheduleValidationState];
    case WeekDays.saturday:
      if (hasError) {
        errorList[5][WeekDays.saturday]![event.index] = true;

        dayScheduleValidationState = dayScheduleValidationState.clone(
          dayScheduleValidationState,
          message: "Start Time must be less than End Time",
          index: event.index,
          day: event.day,
          errorList: errorList,
        );
      } else {
        errorList[5][WeekDays.saturday]![event.index] = false;

        dayScheduleValidationState = dayScheduleValidationState
            .clone(dayScheduleValidationState, errorList: errorList);
      }
      saturdaySchedule[event.index] = TimeSlot(start: startTime, end: endTime);
      calentreEventState =
          calentreEventState.clone(calentreEventState, days: updatedDays);
      return [calentreEventState, dayScheduleValidationState];
    case WeekDays.sunday:
      if (hasError) {
        errorList[6][WeekDays.sunday]![event.index] = true;

        dayScheduleValidationState = dayScheduleValidationState.clone(
          dayScheduleValidationState,
          message: "Start Time must be less than End Time",
          index: event.index,
          day: event.day,
          errorList: errorList,
        );
      } else {
        errorList[6][WeekDays.sunday]![event.index] = false;

        dayScheduleValidationState = dayScheduleValidationState
            .clone(dayScheduleValidationState, errorList: errorList);
      }
      sundaySchedule[event.index] = TimeSlot(start: startTime, end: endTime);
      calentreEventState =
          calentreEventState.clone(calentreEventState, days: updatedDays);
      return [calentreEventState, dayScheduleValidationState];
  }
}
