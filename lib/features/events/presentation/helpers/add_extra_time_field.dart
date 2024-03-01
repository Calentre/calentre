import 'package:calentre/features/events/presentation/bloc/event/event_bloc.dart';
import 'package:calentre/features/events/presentation/helpers/validate_time_drop_down.dart';
import 'package:flutter/material.dart';

void addExtraTimeFieldHelper(
    {required String day,
    required CalentreEventBloc calentreEventBloc,
    required BuildContext context,
    required int index}) {
  //Add an initial TimeSlot for the new field
  switch (day) {
    case "Mon":
      calentreEventBloc.errorList[0]["Mon"]!.add(false);
      calentreEventBloc.days.monday!
          .add(CalTimeSlot(start: "12:00 AM", end: "12:30 AM"));

      validateTimeDropDownHelper(
        calentreEventBloc: calentreEventBloc,
        day: "Mon",
        index: index,
      );

      break;
    case "Tue":
      calentreEventBloc.errorList[0]["Tue"]!.add(false);
      calentreEventBloc.days.tuesday!
          .add(CalTimeSlot(start: "12:00 AM", end: "11:50 PM"));
      validateTimeDropDownHelper(
        calentreEventBloc: calentreEventBloc,
        day: "Tue",
        index: index,
      );
      break;
    case "Wed":
      calentreEventBloc.days.wednesday!
          .add(CalTimeSlot(start: "12:00 AM", end: "11:50 PM"));
      validateTimeDropDownHelper(
        calentreEventBloc: calentreEventBloc,
        day: "Wed",
        index: index,
      );
      break;
    case "Thur":
      calentreEventBloc.days.thursday!
          .add(CalTimeSlot(start: "12:00 AM", end: "11:50 PM"));
      validateTimeDropDownHelper(
        calentreEventBloc: calentreEventBloc,
        day: "Thur",
        index: index,
      );
      break;
    case "Fri":
      calentreEventBloc.days.friday!
          .add(CalTimeSlot(start: "12:00 AM", end: "11:50 PM"));
      validateTimeDropDownHelper(
        calentreEventBloc: calentreEventBloc,
        day: "Fri",
        index: index,
      );
      break;
    case "Sat":
      calentreEventBloc.days.saturday!
          .add(CalTimeSlot(start: "12:00 AM", end: "11:50 PM"));
      validateTimeDropDownHelper(
        calentreEventBloc: calentreEventBloc,
        day: "Sat",
        index: index,
      );
      break;
    case "Sun":
      calentreEventBloc.days.sunday!
          .add(CalTimeSlot(start: "12:00 AM", end: "11:50 PM"));
      validateTimeDropDownHelper(
        calentreEventBloc: calentreEventBloc,
        day: "Sun",
        index: index,
      );
      break;
    default:
  }
}
