import 'package:calentre/config/constants/time_list.dart';
import 'package:calentre/config/enums/weekdays.dart';
import 'package:calentre/features/events/domain/entities/availability_entity.dart';
import 'package:calentre/features/events/domain/entities/time_slot_enitity.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_state.dart';

///Adds a new [TimeSlot] and initializes the errorList with a [false]
///value within the [DayScheduleValidationState].
///

List addNewTimeFieldHelper(
    CalentreEventState calentreEventState,
    DayScheduleValidationState dayScheduleValidationState,
    AddNewTimeFieldEvent event) {
  //Create a new list from the current day states
  List<TimeSlotEntity> mondaySchedule = [...calentreEventState.days.monday];
  List<TimeSlotEntity> tuesdaySchedule = [...calentreEventState.days.tuesday];
  List<TimeSlotEntity> wednesdaySchedule = [
    ...calentreEventState.days.wednesday
  ];
  List<TimeSlotEntity> thursdaySchedule = [...calentreEventState.days.thursday];
  List<TimeSlotEntity> fridaySchedule = [...calentreEventState.days.friday];
  List<TimeSlotEntity> saturdaySchedule = [...calentreEventState.days.saturday];
  List<TimeSlotEntity> sundaySchedule = [...calentreEventState.days.sunday];

  //Create a new object with the updated days schedule
  final updatedDays = AvailabilityEntity(
      monday: mondaySchedule,
      tuesday: tuesdaySchedule,
      wednesday: wednesdaySchedule,
      thursday: thursdaySchedule,
      friday: fridaySchedule,
      saturday: saturdaySchedule,
      sunday: sundaySchedule);

  //Create a new error list from from the current state
  List<Map<WeekDays, List<bool>>> errorList = [
    ...dayScheduleValidationState.errorList
  ];

  switch (event.day) {
    case WeekDays.monday:
      mondaySchedule.add(
          TimeSlotEntity(TimeList().timeList.first, TimeList().timeList[1]));
      calentreEventState =
          calentreEventState.clone(calentreEventState, days: updatedDays);

      errorList[0][WeekDays.monday]!.add(false);
      dayScheduleValidationState = dayScheduleValidationState
          .clone(dayScheduleValidationState, errorList: errorList);
      return [calentreEventState, dayScheduleValidationState];

    case WeekDays.tuesday:
      tuesdaySchedule.add(
          TimeSlotEntity(TimeList().timeList.first, TimeList().timeList[1]));
      calentreEventState =
          calentreEventState.clone(calentreEventState, days: updatedDays);

      errorList[1][WeekDays.tuesday]!.add(false);
      dayScheduleValidationState = dayScheduleValidationState
          .clone(dayScheduleValidationState, errorList: errorList);
      return [calentreEventState, dayScheduleValidationState];

    case WeekDays.wednesday:
      wednesdaySchedule.add(
          TimeSlotEntity(TimeList().timeList.first, TimeList().timeList[1]));
      calentreEventState =
          calentreEventState.clone(calentreEventState, days: updatedDays);

      errorList[2][WeekDays.wednesday]!.add(false);
      dayScheduleValidationState = dayScheduleValidationState
          .clone(dayScheduleValidationState, errorList: errorList);
      return [calentreEventState, dayScheduleValidationState];

    case WeekDays.thursday:
      thursdaySchedule.add(
          TimeSlotEntity(TimeList().timeList.first, TimeList().timeList[1]));
      calentreEventState =
          calentreEventState.clone(calentreEventState, days: updatedDays);

      errorList[3][WeekDays.thursday]!.add(false);
      dayScheduleValidationState = dayScheduleValidationState
          .clone(dayScheduleValidationState, errorList: errorList);
      return [calentreEventState, dayScheduleValidationState];

    case WeekDays.friday:
      fridaySchedule.add(
          TimeSlotEntity(TimeList().timeList.first, TimeList().timeList[1]));
      calentreEventState =
          calentreEventState.clone(calentreEventState, days: updatedDays);

      errorList[4][WeekDays.friday]!.add(false);
      dayScheduleValidationState = dayScheduleValidationState
          .clone(dayScheduleValidationState, errorList: errorList);
      return [calentreEventState, dayScheduleValidationState];

    case WeekDays.saturday:
      saturdaySchedule.add(
          TimeSlotEntity(TimeList().timeList.first, TimeList().timeList[1]));
      calentreEventState =
          calentreEventState.clone(calentreEventState, days: updatedDays);

      errorList[5][WeekDays.saturday]!.add(false);
      dayScheduleValidationState = dayScheduleValidationState
          .clone(dayScheduleValidationState, errorList: errorList);
      return [calentreEventState, dayScheduleValidationState];

    case WeekDays.sunday:
      sundaySchedule.add(
          TimeSlotEntity(TimeList().timeList.first, TimeList().timeList[1]));
      calentreEventState =
          calentreEventState.clone(calentreEventState, days: updatedDays);

      errorList[6][WeekDays.sunday]!.add(false);
      dayScheduleValidationState = dayScheduleValidationState
          .clone(dayScheduleValidationState, errorList: errorList);
      return [calentreEventState, dayScheduleValidationState];

    default:
      return [calentreEventState, dayScheduleValidationState];
  }
}
