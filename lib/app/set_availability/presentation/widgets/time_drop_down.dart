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
    List<String> list = <String>["12:00 AM", "12:30 AM", "1:00 AM"];

    return BlocBuilder<TimeDropDownBloc, FormDropDownState>(
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
    });
  }
}
