import 'package:calentre/config/enums/weekdays.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_bloc.dart';
import 'package:calentre/features/events/presentation/helpers/validate_time_drop_down.dart';
import 'package:flutter/material.dart';

void addExtraTimeFieldHelper(
    {required WeekDays day,
    required CalentreEventBloc calentreEventBloc,
    required BuildContext context,
    required int index}) {
  //Add an initial TimeSlot for the new field
  switch (day) {
    case WeekDays.monday:
      calentreEventBloc.errorList[0]["Mon"]!.add(false);
      calentreEventBloc.days.monday!
          .add(CalTimeSlot(start: "12:00 AM", end: "12:30 AM"));

      validateTimeDropDownHelper(
        calentreEventBloc: calentreEventBloc,
        day: "Mon",
        index: index,
      );

      break;
    case WeekDays.tuesday:
      calentreEventBloc.errorList[1]["Tue"]!.add(false);
      calentreEventBloc.days.tuesday!
          .add(CalTimeSlot(start: "12:00 AM", end: "12:30 AM"));
      validateTimeDropDownHelper(
        calentreEventBloc: calentreEventBloc,
        day: "Tue",
        index: index,
      );
      break;
    case WeekDays.wednesday:
      calentreEventBloc.errorList[2]["Wed"]!.add(false);
      calentreEventBloc.days.wednesday!
          .add(CalTimeSlot(start: "12:00 AM", end: "12:30 AM"));
      validateTimeDropDownHelper(
        calentreEventBloc: calentreEventBloc,
        day: "Wed",
        index: index,
      );
      break;
    case WeekDays.thursday:
      calentreEventBloc.errorList[3]["Thur"]!.add(false);
      calentreEventBloc.days.thursday!
          .add(CalTimeSlot(start: "12:00 AM", end: "12:30 AM"));
      validateTimeDropDownHelper(
        calentreEventBloc: calentreEventBloc,
        day: "Thur",
        index: index,
      );
      break;
    case WeekDays.friday:
      calentreEventBloc.errorList[4]["Fri"]!.add(false);
      calentreEventBloc.days.friday!
          .add(CalTimeSlot(start: "12:00 AM", end: "12:30 AM"));
      validateTimeDropDownHelper(
        calentreEventBloc: calentreEventBloc,
        day: "Fri",
        index: index,
      );
      break;
    case WeekDays.saturday:
      calentreEventBloc.errorList[5]["Sat"]!.add(false);
      calentreEventBloc.days.saturday!
          .add(CalTimeSlot(start: "12:00 AM", end: "12:30 AM"));
      validateTimeDropDownHelper(
        calentreEventBloc: calentreEventBloc,
        day: "Sat",
        index: index,
      );
      break;
    case WeekDays.sunday:
      calentreEventBloc.errorList[6]["Sun"]!.add(false);
      calentreEventBloc.days.sunday!
          .add(CalTimeSlot(start: "12:00 AM", end: "12:30 AM"));
      validateTimeDropDownHelper(
        calentreEventBloc: calentreEventBloc,
        day: "Sun",
        index: index,
      );
      break;
    default:
  }
}
