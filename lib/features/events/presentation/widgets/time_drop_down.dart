import 'package:calentre/config/constants/time_list.dart';
import 'package:calentre/config/enums/time_slots.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/time_drop_down_bloc.dart';
import 'package:calentre/shared/form_drop_down/bloc/form_drop_down_event.dart';
import 'package:calentre/shared/form_drop_down/bloc/form_drop_down_state.dart';
import 'package:calentre/shared/form_drop_down/form_drop_down.dart';
import 'package:calentre/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeDropDown extends StatefulWidget {
  const TimeDropDown(
      {super.key, required this.day, required this.timeSlotBoundary});
  final Map<String, dynamic> day;
  final TimeSlotBoundary timeSlotBoundary;

  @override
  State<TimeDropDown> createState() => _TimeDropDownState();
}

class _TimeDropDownState extends State<TimeDropDown> {
  String currentValue = "";
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimeDropDownBloc>(
      create: (context) => TimeDropDownBloc(),
      child: BlocBuilder<TimeDropDownBloc, FormDropDownState>(
          builder: (context, state) {
        return FormDropDown(
          currentValue:
              BlocProvider.of<TimeDropDownBloc>(context).dropDownValue == ""
                  ? (widget.timeSlotBoundary == TimeSlotBoundary.start
                      ? switchTimeList(widget.day["day"]).first
                      : switchTimeList(widget.day["day"]).last)
                  : BlocProvider.of<TimeDropDownBloc>(context).dropDownValue,
          list: switchTimeList(widget.day["day"]),
          onChanged: (String? value) {
            final calentreEventBloc =
                BlocProvider.of<CalentreEventBloc>(context);
            // setState(() {
            //   currentValue = value!;
            // });
            BlocProvider.of<TimeDropDownBloc>(
              context,
            ).dropDownValue = value!;
            BlocProvider.of<TimeDropDownBloc>(context)
                .add(SelectDropDownValueEvent());

///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
            switch (widget.day["day"]) {
              case "Mon":
                var currentIndex = widget.day["index"];

                if (widget.timeSlotBoundary == TimeSlotBoundary.start) {
                  calentreEventBloc.days.monday![currentIndex].start = value;
                } else {
                  calentreEventBloc.days.monday![currentIndex].end = value;
                }

                //Print all Time slot in Monday
                CL.logSuccess(
                    "${widget.day} ${calentreEventBloc.days.monday![0].start}");
                CL.logSuccess(
                    "${widget.day} ${calentreEventBloc.days.monday![0].end}");

                break;
              case "Tue":
                var currentIndex = widget.day["index"];

                if (widget.timeSlotBoundary == TimeSlotBoundary.start) {
                  calentreEventBloc.days.tuesday![currentIndex].start = value;
                } else {
                  calentreEventBloc.days.tuesday![currentIndex].end = value;
                }

                //Print all Time slot in Tuesday
                CL.logSuccess(
                    "${widget.day} ${calentreEventBloc.days.tuesday![0].start}");
                CL.logSuccess(
                    "${widget.day} ${calentreEventBloc.days.tuesday![0].end}");

                break;
              case "Wed":
                var currentIndex = widget.day["index"];

                if (widget.timeSlotBoundary == TimeSlotBoundary.start) {
                  calentreEventBloc.days.wednesday![currentIndex].start = value;
                } else {
                  calentreEventBloc.days.wednesday![currentIndex].end = value;
                }

                break;

              case "Thur":
                var currentIndex = widget.day["index"];

                if (widget.timeSlotBoundary == TimeSlotBoundary.start) {
                  calentreEventBloc.days.thursday![currentIndex].start = value;
                } else {
                  calentreEventBloc.days.thursday![currentIndex].end = value;
                }
                break;

              case "Fri":
                var currentIndex = widget.day["index"];

                if (widget.timeSlotBoundary == TimeSlotBoundary.start) {
                  calentreEventBloc.days.friday![currentIndex].start = value;
                } else {
                  calentreEventBloc.days.friday![currentIndex].end = value;
                }

                break;
              case "Sat":
                var currentIndex = widget.day["index"];

                if (widget.timeSlotBoundary == TimeSlotBoundary.start) {
                  calentreEventBloc.days.saturday![currentIndex].start = value;
                } else {
                  calentreEventBloc.days.saturday![currentIndex].end = value;
                }

                break;
              case "Sun":
                var currentIndex = widget.day["index"];

                if (widget.timeSlotBoundary == TimeSlotBoundary.start) {
                  calentreEventBloc.days.sunday![currentIndex].start = value;
                } else {
                  calentreEventBloc.days.sunday![currentIndex].end = value;
                }

                break;
            }
///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
          },
          items: switchTimeList(widget.day["day"])
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(
                children: [
                  Text(value),
                ],
              ),
            );
          }).toList(),
        );
      }),
    );
  }
}

//This returns a list of time based on the current day of the list rendering
List<String> switchTimeList(String day) {
  switch (day) {
    case "Mon":
      return mondayTimeList.timeList;
    case "Tue":
      return tuesdayTimeList.timeList;
    case "Wed":
      return wednesdayTimeList.timeList;
    case "Thur":
      return thursdayTimeList.timeList;
    case "Fri":
      return fridayTimeList.timeList;
    case "Sat":
      return saturdayTimeList.timeList;
    case "Sun":
      return sundayTimeList.timeList;
    default:
      return TimeList().timeList;
  }
}
