import 'package:calentre/config/enums/weekdays.dart';
import 'package:calentre/features/events/data/models/calentre_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_state.dart';

void removeNewTimeFieldHelper(
    CalentreEventState calentreEventState,
    DayScheduleValidationState dayScheduleValidationState,
    RemoveTimeFieldEvent event) {
  switch (event.day) {
    case WeekDays.monday:
      List<TimeSlot> mondaySchedule = [...calentreEventState.days.monday!];
      mondaySchedule.removeLast();
      calentreEventState.clone(days: Days(monday: mondaySchedule));

      List<Map<WeekDays, List<bool>>> errorList = [
        ...dayScheduleValidationState.errorList
      ];
      errorList[0][WeekDays.monday]!.removeLast();
      dayScheduleValidationState.clone(errorList: errorList);
      break;
    case WeekDays.tuesday:
      List<TimeSlot> tuesdaySchedule = [...calentreEventState.days.tuesday!];
      tuesdaySchedule.removeLast();
      calentreEventState.clone(days: Days(tuesday: tuesdaySchedule));

      List<Map<WeekDays, List<bool>>> errorList = [
        ...dayScheduleValidationState.errorList
      ];
      errorList[1][WeekDays.tuesday]!.removeLast();
      dayScheduleValidationState.clone(errorList: errorList);
      break;
    case WeekDays.wednesday:
      List<TimeSlot> wednesdaySchedule = [
        ...calentreEventState.days.wednesday!
      ];
      wednesdaySchedule.removeLast();
      calentreEventState.clone(days: Days(wednesday: wednesdaySchedule));

      List<Map<WeekDays, List<bool>>> errorList = [
        ...dayScheduleValidationState.errorList
      ];
      errorList[2][WeekDays.wednesday]!.removeLast();
      dayScheduleValidationState.clone(errorList: errorList);
      break;
    case WeekDays.thursday:
      List<TimeSlot> thursdaySchedule = [...calentreEventState.days.thursday!];
      thursdaySchedule.removeLast();
      calentreEventState.clone(days: Days(thursday: thursdaySchedule));

      List<Map<WeekDays, List<bool>>> errorList = [
        ...dayScheduleValidationState.errorList
      ];
      errorList[3][WeekDays.thursday]!.removeLast();
      dayScheduleValidationState.clone(errorList: errorList);
      break;
    case WeekDays.friday:
      List<TimeSlot> fridaySchedule = [...calentreEventState.days.friday!];
      fridaySchedule.removeLast();
      calentreEventState.clone(days: Days(friday: fridaySchedule));

      List<Map<WeekDays, List<bool>>> errorList = [
        ...dayScheduleValidationState.errorList
      ];
      errorList[4][WeekDays.friday]!.removeLast();
      dayScheduleValidationState.clone(errorList: errorList);
      break;
    case WeekDays.saturday:
      List<TimeSlot> saturdaySchedule = [...calentreEventState.days.saturday!];
      saturdaySchedule.removeLast();
      calentreEventState.clone(days: Days(saturday: saturdaySchedule));

      List<Map<WeekDays, List<bool>>> errorList = [
        ...dayScheduleValidationState.errorList
      ];
      errorList[5][WeekDays.saturday]!.removeLast();
      dayScheduleValidationState.clone(errorList: errorList);
      break;
    case WeekDays.sunday:
      List<TimeSlot> sundaySchedule = [...calentreEventState.days.sunday!];
      sundaySchedule.removeLast();
      calentreEventState.clone(days: Days(sunday: sundaySchedule));

      List<Map<WeekDays, List<bool>>> errorList = [
        ...dayScheduleValidationState.errorList
      ];
      errorList[6][WeekDays.sunday]!.removeLast();
      dayScheduleValidationState.clone(errorList: errorList);
      break;
    default:
      break;
  }
}
