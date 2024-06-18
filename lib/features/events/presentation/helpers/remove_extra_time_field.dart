import 'package:calentre/config/enums/weekdays.dart';
import 'package:calentre/features/events/data/models/calentre_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_state.dart';

///Removes a the last [TimeSlot] and last value of the errorList
///within the [DayScheduleValidationState].
List removeNewTimeFieldHelper(
    CalentreEventState calentreEventState,
    DayScheduleValidationState dayScheduleValidationState,
    RemoveTimeFieldEvent event) {
  final days = calentreEventState.days;
  List<TimeSlot> mondaySchedule = [...days.monday!];
  List<TimeSlot> tuesdaySchedule = [...days.tuesday!];
  List<TimeSlot> wednesdaySchedule = [...days.wednesday!];
  List<TimeSlot> thursdaySchedule = [...days.thursday!];
  List<TimeSlot> fridaySchedule = [...days.friday!];
  List<TimeSlot> saturdaySchedule = [...days.saturday!];
  List<TimeSlot> sundaySchedule = [...days.sunday!];
  final state = calentreEventState;
  switch (event.day) {
    case WeekDays.monday:
      mondaySchedule.removeLast();
      calentreEventState = calentreEventState.clone(state,
          days: Days(
              monday: mondaySchedule,
              tuesday: tuesdaySchedule,
              wednesday: wednesdaySchedule,
              thursday: thursdaySchedule,
              friday: fridaySchedule,
              saturday: saturdaySchedule,
              sunday: sundaySchedule));

      List<Map<WeekDays, List<bool>>> errorList = [
        ...dayScheduleValidationState.errorList
      ];
      errorList[0][WeekDays.monday]!.removeLast();
      dayScheduleValidationState = dayScheduleValidationState
          .clone(dayScheduleValidationState, errorList: errorList);
      return [calentreEventState, dayScheduleValidationState];
    case WeekDays.tuesday:
      tuesdaySchedule.removeLast();
      calentreEventState = calentreEventState.clone(state,
          days: Days(
              monday: mondaySchedule,
              tuesday: tuesdaySchedule,
              wednesday: wednesdaySchedule,
              thursday: thursdaySchedule,
              friday: fridaySchedule,
              saturday: saturdaySchedule,
              sunday: sundaySchedule));

      List<Map<WeekDays, List<bool>>> errorList = [
        ...dayScheduleValidationState.errorList
      ];
      errorList[1][WeekDays.tuesday]!.removeLast();
      dayScheduleValidationState = dayScheduleValidationState
          .clone(dayScheduleValidationState, errorList: errorList);
      return [calentreEventState, dayScheduleValidationState];
    case WeekDays.wednesday:
      wednesdaySchedule.removeLast();
      calentreEventState = calentreEventState.clone(state,
          days: Days(
              monday: mondaySchedule,
              tuesday: tuesdaySchedule,
              wednesday: wednesdaySchedule,
              thursday: thursdaySchedule,
              friday: fridaySchedule,
              saturday: saturdaySchedule,
              sunday: sundaySchedule));

      List<Map<WeekDays, List<bool>>> errorList = [
        ...dayScheduleValidationState.errorList
      ];
      errorList[2][WeekDays.wednesday]!.removeLast();
      dayScheduleValidationState = dayScheduleValidationState
          .clone(dayScheduleValidationState, errorList: errorList);
      return [calentreEventState, dayScheduleValidationState];
    case WeekDays.thursday:
      thursdaySchedule.removeLast();
      calentreEventState = calentreEventState.clone(state,
          days: Days(
              monday: mondaySchedule,
              tuesday: tuesdaySchedule,
              wednesday: wednesdaySchedule,
              thursday: thursdaySchedule,
              friday: fridaySchedule,
              saturday: saturdaySchedule,
              sunday: sundaySchedule));

      List<Map<WeekDays, List<bool>>> errorList = [
        ...dayScheduleValidationState.errorList
      ];
      errorList[3][WeekDays.monday]!.removeLast();
      dayScheduleValidationState = dayScheduleValidationState
          .clone(dayScheduleValidationState, errorList: errorList);
      return [calentreEventState, dayScheduleValidationState];
    case WeekDays.friday:
      fridaySchedule.removeLast();
      calentreEventState = calentreEventState.clone(state,
          days: Days(
              monday: mondaySchedule,
              tuesday: tuesdaySchedule,
              wednesday: wednesdaySchedule,
              thursday: thursdaySchedule,
              friday: fridaySchedule,
              saturday: saturdaySchedule,
              sunday: sundaySchedule));

      List<Map<WeekDays, List<bool>>> errorList = [
        ...dayScheduleValidationState.errorList
      ];
      errorList[4][WeekDays.friday]!.removeLast();
      dayScheduleValidationState = dayScheduleValidationState
          .clone(dayScheduleValidationState, errorList: errorList);
      return [calentreEventState, dayScheduleValidationState];
    case WeekDays.saturday:
      saturdaySchedule.removeLast();
      calentreEventState = calentreEventState.clone(state,
          days: Days(
              monday: mondaySchedule,
              tuesday: tuesdaySchedule,
              wednesday: wednesdaySchedule,
              thursday: thursdaySchedule,
              friday: fridaySchedule,
              saturday: saturdaySchedule,
              sunday: sundaySchedule));

      List<Map<WeekDays, List<bool>>> errorList = [
        ...dayScheduleValidationState.errorList
      ];
      errorList[5][WeekDays.saturday]!.removeLast();
      dayScheduleValidationState = dayScheduleValidationState
          .clone(dayScheduleValidationState, errorList: errorList);
      return [calentreEventState, dayScheduleValidationState];
    case WeekDays.sunday:
      sundaySchedule.removeLast();
      calentreEventState = calentreEventState.clone(state,
          days: Days(
              monday: mondaySchedule,
              tuesday: tuesdaySchedule,
              wednesday: wednesdaySchedule,
              thursday: thursdaySchedule,
              friday: fridaySchedule,
              saturday: saturdaySchedule,
              sunday: sundaySchedule));

      List<Map<WeekDays, List<bool>>> errorList = [
        ...dayScheduleValidationState.errorList
      ];
      errorList[6][WeekDays.sunday]!.removeLast();
      dayScheduleValidationState = dayScheduleValidationState
          .clone(dayScheduleValidationState, errorList: errorList);
      return [calentreEventState, dayScheduleValidationState];
    default:
      return [calentreEventState, dayScheduleValidationState];
  }
}
