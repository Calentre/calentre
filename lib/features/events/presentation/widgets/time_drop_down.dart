import 'package:calentre/config/constants/time_list.dart';
import 'package:calentre/config/enums/time_slots.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/set_availability_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/set_availability_event.dart';
import 'package:calentre/features/events/presentation/bloc/time_drop_down/time_drop_down_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/time_drop_down/time_drop_down_event.dart';
import 'package:calentre/features/events/presentation/bloc/time_drop_down/time_drop_down_state.dart';
import 'package:calentre/injection_container.dart';
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
  @override
  State<TimeDropDown> createState() => _TimeDropDownState();
}

class _TimeDropDownState extends State<TimeDropDown> {
  String currentValue = "";
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimeDropDownBloc>(
      create: (context) => TimeDropDownBloc(),
      child: BlocBuilder<TimeDropDownBloc, TimeDropDownState>(
          builder: (context, state) {
        print("Time drop down was rebuilt");
        return Column(
          children: [
            FormDropDown(
              currentValue:
                  BlocProvider.of<TimeDropDownBloc>(context).dropDownValue == ""
                      ? (widget.timeSlotBoundary == TimeSlotBoundary.start
                          ? "12:00 AM"
                          : "12:30 AM")
                      : BlocProvider.of<TimeDropDownBloc>(context)
                          .dropDownValue,
              items: TimeList()
                  .timeList
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
              onChanged: (String? value) {
                final calentreEventBloc =
                    BlocProvider.of<CalentreEventBloc>(context);

                BlocProvider.of<TimeDropDownBloc>(
                  context,
                ).dropDownValue = value!;

                switch (widget.day["day"]) {
                  case "Mon":
                    var currentIndex = widget.day["index"];
                    calentreEventBloc.currentIndex = currentIndex;
                    calentreEventBloc.currentDay = "Mon";
                    if (widget.timeSlotBoundary == TimeSlotBoundary.start) {
                      calentreEventBloc.days.monday![currentIndex].start =
                          value;
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
                      calentreEventBloc.days.tuesday![currentIndex].start =
                          value;
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
                      calentreEventBloc.days.wednesday![currentIndex].start =
                          value;
                    } else {
                      calentreEventBloc.days.wednesday![currentIndex].end =
                          value;
                    }

                    break;

                  case "Thur":
                    var currentIndex = widget.day["index"];

                    if (widget.timeSlotBoundary == TimeSlotBoundary.start) {
                      calentreEventBloc.days.thursday![currentIndex].start =
                          value;
                    } else {
                      calentreEventBloc.days.thursday![currentIndex].start =
                          value;
                    }
                    break;

                  case "Fri":
                    var currentIndex = widget.day["index"];

                    if (widget.timeSlotBoundary == TimeSlotBoundary.start) {
                      calentreEventBloc.days.friday![currentIndex].start =
                          value;
                    } else {
                      calentreEventBloc.days.friday![currentIndex].end = value;
                    }

                    break;
                  case "Sat":
                    var currentIndex = widget.day["index"];

                    if (widget.timeSlotBoundary == TimeSlotBoundary.start) {
                      calentreEventBloc.days.saturday![currentIndex].start =
                          value;
                    } else {
                      calentreEventBloc.days.saturday![currentIndex].end =
                          value;
                    }

                    break;
                  case "Sun":
                    var currentIndex = widget.day["index"];

                    if (widget.timeSlotBoundary == TimeSlotBoundary.start) {
                      calentreEventBloc.days.sunday![currentIndex].start =
                          value;
                    } else {
                      calentreEventBloc.days.sunday![currentIndex].end = value;
                    }

                    break;
                }
                BlocProvider.of<CalentreEventBloc>(context)
                    .validateTimeDropDown(
                  day: widget.day["day"],
                  index: widget.day["index"],
                );
                BlocProvider.of<TimeDropDownBloc>(context)
                    .add(SelectTimeDropDownValueEvent());

                BlocProvider.of<SetAvailabilityBloc>(context)
                    .add(RebuildSetAvailabilityScreenEvent());
              },
            ),
          ],
        );
      }),
    );
  }
}
