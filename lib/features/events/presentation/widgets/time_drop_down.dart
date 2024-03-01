import 'package:calentre/config/constants/time_list.dart';
import 'package:calentre/config/enums/time_slots.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/set_availability_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/set_availability_event.dart';
import 'package:calentre/features/events/presentation/bloc/time_drop_down/time_drop_down_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/time_drop_down/time_drop_down_event.dart';
import 'package:calentre/features/events/presentation/bloc/time_drop_down/time_drop_down_state.dart';
import 'package:calentre/features/events/presentation/helpers/update_current_day_details.dart';
import 'package:calentre/shared/form_drop_down/form_drop_down.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimeDropDownBloc>(
      create: (context) => TimeDropDownBloc(),
      child: BlocBuilder<TimeDropDownBloc, TimeDropDownState>(
          builder: (context, state) {
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

                //Update the bloc with the currently iterating object details
                updateCurrentlyIteratingDayDetails(
                    day: widget.day["day"] as String,
                    value: value,
                    calentreEventBloc: calentreEventBloc,
                    timeSlotBoundary: widget.timeSlotBoundary,
                    index: widget.day["index"] as int,
                    context: context);

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


//Todo
//create enum for the days of the week
//move all time related values from String to Date Time