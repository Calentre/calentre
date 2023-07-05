import 'package:calentre/app/set_availability/presentation/bloc/time_drop_down_bloc.dart';
import 'package:calentre/shared/form_drop_down/bloc/form_drop_down_event.dart';
import 'package:calentre/shared/form_drop_down/bloc/form_drop_down_state.dart';
import 'package:calentre/shared/form_drop_down/form_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeDropDown extends StatefulWidget {
  const TimeDropDown({super.key});

  @override
  State<TimeDropDown> createState() => _TimeDropDownState();
}

class _TimeDropDownState extends State<TimeDropDown> {
  String currentValue = "";
  @override
  Widget build(BuildContext context) {
    List<String> list = <String>[
      "12:00 AM",
      "12:30 AM",
      "1:00 AM",
      "1:30 AM",
      "2:00 AM",
      "2:30 AM",
      "3:00 AM",
      "3:30 AM",
      "4:00 AM",
      "4:30 AM",
      "5:00 AM",
      "5:30 AM",
      "6:00 AM",
      "6:30 AM",
      "7:00 AM",
      "7:30 AM",
      "8:00 AM",
      "8:30 AM",
      "9:00 AM",
      "9:30 AM",
      "10:00 AM",
      "10:30 AM",
      "11:00 AM",
      "11:30 AM",
      "12:00 PM",
      "12:30 PM",
      "1:00 PM",
      "1:30 PM",
      "2:00 PM",
      "2:30 PM",
      "3:00 PM",
      "3:30 PM",
      "4:00 PM",
      "4:30 PM",
      "5:00 PM",
      "5:30 PM",
      "6:00 PM",
      "6:30 PM",
      "7:00 PM",
      "7:30 PM",
      "8:00 PM",
      "8:30 PM",
      "9:00 PM",
      "9:30 PM",
      "10:00 PM",
      "10:30 PM",
      "11:00 PM",
      "11:30 PM",
    ];

    return BlocProvider<TimeDropDownBloc>(
      create: (context) => TimeDropDownBloc(),
      child: BlocBuilder<TimeDropDownBloc, FormDropDownState>(
          builder: (context, state) {
        return FormDropDown(
          currentValue:
              BlocProvider.of<TimeDropDownBloc>(context).dropDownValue == ""
                  ? list.first
                  : BlocProvider.of<TimeDropDownBloc>(context).dropDownValue,
          list: list,
          onChanged: (String? value) {
            // setState(() {
            //   currentValue = value!;
            // });
            BlocProvider.of<TimeDropDownBloc>(
              context,
              // listen: false,
            ).dropDownValue = value!;
            BlocProvider.of<TimeDropDownBloc>(context)
                .add(SelectDropDownValueEvent());
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
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
