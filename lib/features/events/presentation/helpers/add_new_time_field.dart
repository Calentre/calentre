import 'package:calentre/config/constants/time_list.dart';
import 'package:calentre/config/enums/weekdays.dart';
import 'package:calentre/features/events/data/models/calentre_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_state.dart';

///Adds a new [TimeSlot] and initializes the errorList with a [false]
///value within the [DayScheduleValidationState].
///

List addNewTimeFieldHelper(
    CalentreEventState calentreEventState,
    DayScheduleValidationState dayScheduleValidationState,
    AddNewTimeFieldEvent event) {
  final days = calentreEventState.days;
  List<TimeSlot> mondaySchedule = [...days.monday!];
  List<TimeSlot> tuesdaySchedule = [...days.tuesday!];
  List<TimeSlot> wednesdaySchedule = [...days.wednesday!];
  List<TimeSlot> thursdaySchedule = [...days.thursday!];
  List<TimeSlot> fridaySchedule = [...days.friday!];
  List<TimeSlot> saturdaySchedule = [...days.saturday!];
  List<TimeSlot> sundaySchedule = [...days.sunday!];

  switch (event.day) {
    case WeekDays.monday:
      mondaySchedule.add(TimeSlot(
          start: TimeList().timeList.first, end: TimeList().timeList[1]));
      calentreEventState = calentreEventState.clone(calentreEventState,
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
      errorList[0][WeekDays.monday]!.add(false);
      dayScheduleValidationState = dayScheduleValidationState
          .clone(dayScheduleValidationState, errorList: errorList);
      return [calentreEventState, dayScheduleValidationState];

    case WeekDays.tuesday:
      tuesdaySchedule.add(TimeSlot(
          start: TimeList().timeList.first, end: TimeList().timeList[1]));
      calentreEventState = calentreEventState.clone(calentreEventState,
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
      errorList[1][WeekDays.tuesday]!.add(false);
      dayScheduleValidationState = dayScheduleValidationState
          .clone(dayScheduleValidationState, errorList: errorList);
      return [calentreEventState, dayScheduleValidationState];

    case WeekDays.wednesday:
      wednesdaySchedule.add(TimeSlot(
          start: TimeList().timeList.first, end: TimeList().timeList[1]));
      calentreEventState.clone(calentreEventState,
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
      errorList[2][WeekDays.wednesday]!.add(false);
      dayScheduleValidationState.clone(dayScheduleValidationState,
          errorList: errorList);
      return [calentreEventState, dayScheduleValidationState];

    case WeekDays.thursday:
      thursdaySchedule.add(TimeSlot(
          start: TimeList().timeList.first, end: TimeList().timeList[1]));
      calentreEventState.clone(calentreEventState,
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
      errorList[3][WeekDays.thursday]!.add(false);
      dayScheduleValidationState.clone(dayScheduleValidationState,
          errorList: errorList);
      return [calentreEventState, dayScheduleValidationState];

    case WeekDays.friday:
      fridaySchedule.add(TimeSlot(
          start: TimeList().timeList.first, end: TimeList().timeList[1]));
      calentreEventState.clone(calentreEventState,
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
      errorList[4][WeekDays.friday]!.add(false);
      dayScheduleValidationState.clone(dayScheduleValidationState,
          errorList: errorList);
      return [calentreEventState, dayScheduleValidationState];

    case WeekDays.saturday:
      saturdaySchedule.add(TimeSlot(
          start: TimeList().timeList.first, end: TimeList().timeList[1]));
      calentreEventState.clone(calentreEventState,
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
      errorList[5][WeekDays.saturday]!.add(false);
      dayScheduleValidationState.clone(dayScheduleValidationState,
          errorList: errorList);
      return [calentreEventState, dayScheduleValidationState];

    case WeekDays.sunday:
      sundaySchedule.add(TimeSlot(
          start: TimeList().timeList.first, end: TimeList().timeList[1]));
      calentreEventState.clone(calentreEventState,
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
      errorList[6][WeekDays.sunday]!.add(false);
      dayScheduleValidationState.clone(dayScheduleValidationState,
          errorList: errorList);
      return [calentreEventState, dayScheduleValidationState];

    default:
      return [calentreEventState, dayScheduleValidationState];
  }
}
