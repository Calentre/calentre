import 'package:calentre/features/events/presentation/bloc/event_type_drop_down_bloc.dart';
import 'package:calentre/shared/widgets/form_drop_down//bloc/form_drop_down_event.dart';
import 'package:calentre/shared/widgets/form_drop_down//bloc/form_drop_down_state.dart';
import 'package:calentre/shared/widgets/form_drop_down//form_drop_down.dart';
import 'package:calentre/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventTypeDropDown extends StatefulWidget {
  const EventTypeDropDown({super.key});

  @override
  State<EventTypeDropDown> createState() => _EventTypeDropDownState();
}

class _EventTypeDropDownState extends State<EventTypeDropDown> {
  String currentValue = "";

  @override
  Widget build(BuildContext context) {
    List<String> list = <String>["Free", "Paid"];

    return BlocBuilder<EventTypeDropDownBloc, FormDropDownState>(
        builder: (context, state) {
      return FormDropDown(
        currentValue:
            BlocProvider.of<EventTypeDropDownBloc>(context).dropDownValue == ""
                ? list.first
                : BlocProvider.of<EventTypeDropDownBloc>(context).dropDownValue,
        list: list,
        onChanged: (String? value) {
          // setState(() {
          //   currentValue = value!;
          // });
          BlocProvider.of<EventTypeDropDownBloc>(
            context,
            // listen: false,
          ).dropDownValue = value!;
          CL.log("The value is: $value");
          BlocProvider.of<EventTypeDropDownBloc>(context)
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
