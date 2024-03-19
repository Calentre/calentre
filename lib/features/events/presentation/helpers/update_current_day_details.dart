import 'package:calentre/config/enums/time_slots.dart';
import 'package:calentre/config/enums/weekdays.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_bloc.dart';
import 'package:calentre/features/events/presentation/helpers/validate_time_drop_down.dart';
import 'package:flutter/material.dart';

//case switch statement to update calentreEventBloc with the currently iterating day of the week
void updateCurrentlyIteratingDayDetails(
    {required WeekDays day,
    required String value,
    required CalentreEventBloc calentreEventBloc,
    required TimeSlotBoundary timeSlotBoundary,
    required int index,
    required BuildContext context}) {
  switch (day) {
    case WeekDays.monday:
      final currentIndex = index;
      calentreEventBloc.currentIndex = currentIndex;
      calentreEventBloc.currentDay = "Mon";
      if (timeSlotBoundary == TimeSlotBoundary.start) {
        calentreEventBloc.days.monday![currentIndex].start = value;
      } else {
        calentreEventBloc.days.monday![currentIndex].end = value;
      }

      // validateTimeDropDownHelper(
      //     day: day, index: index, calentreEventBloc: calentreEventBloc);

      break;
    case WeekDays.tuesday:
      final currentIndex = index;
      calentreEventBloc.currentIndex = currentIndex;
      calentreEventBloc.currentDay = "Tue";
      if (timeSlotBoundary == TimeSlotBoundary.start) {
        calentreEventBloc.days.tuesday![currentIndex].start = value;
      } else {
        calentreEventBloc.days.tuesday![currentIndex].end = value;
      }
      // validateTimeDropDownHelper(
      //     day: day, index: index, calentreEventBloc: calentreEventBloc);

      break;
    case WeekDays.wednesday:
      final currentIndex = index;

      calentreEventBloc.currentIndex = currentIndex;
      calentreEventBloc.currentDay = "Wed";

      if (timeSlotBoundary == TimeSlotBoundary.start) {
        calentreEventBloc.days.wednesday![currentIndex].start = value;
      } else {
        calentreEventBloc.days.wednesday![currentIndex].end = value;
      }
      // validateTimeDropDownHelper(
      //     day: day, index: index, calentreEventBloc: calentreEventBloc);

      break;

    case WeekDays.thursday:
      final currentIndex = index;
      calentreEventBloc.currentIndex = currentIndex;
      calentreEventBloc.currentDay = "Thur";
      if (timeSlotBoundary == TimeSlotBoundary.start) {
        calentreEventBloc.days.thursday![currentIndex].start = value;
      } else {
        calentreEventBloc.days.thursday![currentIndex].start = value;
      }
      // validateTimeDropDownHelper(
      //     day: day, index: index, calentreEventBloc: calentreEventBloc);
      break;

    case WeekDays.friday:
      var currentIndex = index;
      calentreEventBloc.currentIndex = currentIndex;
      calentreEventBloc.currentDay = "Fri";
      if (timeSlotBoundary == TimeSlotBoundary.start) {
        calentreEventBloc.days.friday![currentIndex].start = value;
      } else {
        calentreEventBloc.days.friday![currentIndex].end = value;
      }
      // validateTimeDropDownHelper(
      //     day: day, index: index, calentreEventBloc: calentreEventBloc);

      break;
    case WeekDays.saturday:
      var currentIndex = index;
      calentreEventBloc.currentIndex = currentIndex;
      calentreEventBloc.currentDay = "Sat";

      if (timeSlotBoundary == TimeSlotBoundary.start) {
        calentreEventBloc.days.saturday![currentIndex].start = value;
      } else {
        calentreEventBloc.days.saturday![currentIndex].end = value;
      }
      // validateTimeDropDownHelper(
      //     day: day, index: index, calentreEventBloc: calentreEventBloc);
      break;
    case WeekDays.sunday:
      var currentIndex = index;
      if (timeSlotBoundary == TimeSlotBoundary.start) {
        calentreEventBloc.days.sunday![currentIndex].start = value;
      } else {
        calentreEventBloc.days.sunday![currentIndex].end = value;
      }
      // validateTimeDropDownHelper(
      //     day: day, index: index, calentreEventBloc: calentreEventBloc);

      break;
  }
}
