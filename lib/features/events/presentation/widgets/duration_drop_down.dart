import 'package:calentre/features/events/presentation/bloc/duration_drop_down_bloc.dart';
import 'package:calentre/shared/widgets/form_drop_down/bloc/form_drop_down_event.dart';
import 'package:calentre/shared/widgets/form_drop_down/bloc/form_drop_down_state.dart';
import 'package:calentre/shared/widgets/form_drop_down/form_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DurationDropDown extends StatefulWidget {
  const DurationDropDown({super.key});

  @override
  State<DurationDropDown> createState() => _DurationDropDownState();
}

class _DurationDropDownState extends State<DurationDropDown> {
  String currentValue = "";
  @override
  Widget build(BuildContext context) {
    List<String> list = <String>[
      "5 min",
      "10 min",
      "15 min",
      "20 min",
      "30 min",
      "45 min",
      "1 hour",
      "Custom "
    ];

    return BlocBuilder<DurationDropDownBloc, FormDropDownState>(
        builder: (context, state) {
      return FormDropDown(
        currentValue:
            BlocProvider.of<DurationDropDownBloc>(context).dropDownValue == ""
                ? list.first
                : BlocProvider.of<DurationDropDownBloc>(context).dropDownValue,
        list: list,
        onChanged: (String? value) {
          // setState(() {
          //   currentValue = value!;
          // });
          BlocProvider.of<DurationDropDownBloc>(
            context,
            listen: false,
          ).dropDownValue = value!;
          BlocProvider.of<DurationDropDownBloc>(context)
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
