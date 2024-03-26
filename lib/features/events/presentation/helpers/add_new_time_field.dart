import 'package:calentre/config/constants/time_list.dart';
import 'package:calentre/config/enums/weekdays.dart';
import 'package:calentre/features/events/data/models/calentre_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_state.dart';

///Adds a new [TimeSlot] and initializes the errorList with a [false]
///value within the [DayScheduleValidationState] for every new field added.
void addNewTimeFieldHelper(
    CalentreEventState calentreEventState,
    DayScheduleValidationState dayScheduleValidationState,
    AddNewTimeFieldEvent event) {
  switch (event.day) {
    case WeekDays.monday:
      List<TimeSlot> mondaySchedule = [...calentreEventState.days.monday!];
      mondaySchedule.add(TimeSlot(
          start: TimeList().timeList.first, end: TimeList().timeList[1]));
      calentreEventState.clone(days: Days(monday: mondaySchedule));

      List<Map<WeekDays, List<bool>>> errorList = [
        ...dayScheduleValidationState.errorList
      ];
      errorList[0][WeekDays.monday]!.add(false);
      dayScheduleValidationState.clone(errorList: errorList);
      break;
    case WeekDays.tuesday:
      List<TimeSlot> tuesdaySchedule = [...calentreEventState.days.tuesday!];
      tuesdaySchedule.add(TimeSlot(
          start: TimeList().timeList.first, end: TimeList().timeList[1]));
      calentreEventState.clone(days: Days(tuesday: tuesdaySchedule));

      List<Map<WeekDays, List<bool>>> errorList = [
        ...dayScheduleValidationState.errorList
      ];
      errorList[1][WeekDays.tuesday]!.add(false);
      dayScheduleValidationState.clone(errorList: errorList);
      break;
    case WeekDays.wednesday:
      List<TimeSlot> wednesdaySchedule = [
        ...calentreEventState.days.wednesday!
      ];
      wednesdaySchedule.add(TimeSlot(
          start: TimeList().timeList.first, end: TimeList().timeList[1]));
      calentreEventState.clone(days: Days(wednesday: wednesdaySchedule));

      List<Map<WeekDays, List<bool>>> errorList = [
        ...dayScheduleValidationState.errorList
      ];
      errorList[2][WeekDays.wednesday]!.add(false);
      dayScheduleValidationState.clone(errorList: errorList);
      break;
    case WeekDays.thursday:
      List<TimeSlot> thursdaySchedule = [...calentreEventState.days.thursday!];
      thursdaySchedule.add(TimeSlot(
          start: TimeList().timeList.first, end: TimeList().timeList[1]));
      calentreEventState.clone(days: Days(thursday: thursdaySchedule));

      List<Map<WeekDays, List<bool>>> errorList = [
        ...dayScheduleValidationState.errorList
      ];
      errorList[3][WeekDays.thursday]!.add(false);
      dayScheduleValidationState.clone(errorList: errorList);
      break;
    case WeekDays.friday:
      List<TimeSlot> fridaySchedule = [...calentreEventState.days.friday!];
      fridaySchedule.add(TimeSlot(
          start: TimeList().timeList.first, end: TimeList().timeList[1]));
      calentreEventState.clone(days: Days(friday: fridaySchedule));

      List<Map<WeekDays, List<bool>>> errorList = [
        ...dayScheduleValidationState.errorList
      ];
      errorList[4][WeekDays.friday]!.add(false);
      dayScheduleValidationState.clone(errorList: errorList);
      break;
    case WeekDays.saturday:
      List<TimeSlot> saturdaySchedule = [...calentreEventState.days.saturday!];
      saturdaySchedule.add(TimeSlot(
          start: TimeList().timeList.first, end: TimeList().timeList[1]));
      calentreEventState.clone(days: Days(saturday: saturdaySchedule));

      List<Map<WeekDays, List<bool>>> errorList = [
        ...dayScheduleValidationState.errorList
      ];
      errorList[5][WeekDays.saturday]!.add(false);
      dayScheduleValidationState.clone(errorList: errorList);
      break;
    case WeekDays.sunday:
      List<TimeSlot> sundaySchedule = [...calentreEventState.days.sunday!];
      sundaySchedule.add(TimeSlot(
          start: TimeList().timeList.first, end: TimeList().timeList[1]));
      calentreEventState.clone(days: Days(sunday: sundaySchedule));

      List<Map<WeekDays, List<bool>>> errorList = [
        ...dayScheduleValidationState.errorList
      ];
      errorList[6][WeekDays.sunday]!.add(false);
      dayScheduleValidationState.clone(errorList: errorList);
      break;
    default:
  }
}
