import 'package:calentre/shared/form_drop_down/bloc/form_drop_down_bloc.dart';
import 'package:calentre/shared/form_drop_down/bloc/form_drop_down_event.dart';
import 'package:calentre/shared/form_drop_down/bloc/form_drop_down_state.dart';
import 'package:calentre/shared/form_drop_down/form_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlatformDropDown extends StatefulWidget {
  const PlatformDropDown({super.key});

  @override
  State<PlatformDropDown> createState() => _PlatformDropDownState();
}

class _PlatformDropDownState extends State<PlatformDropDown> {
  String currentValue = "";
  @override
  Widget build(BuildContext context) {
    List<String> list = <String>["Meet", "Teams", "Zoom"];

    return BlocBuilder<FormDropDownBloc, FormDropDownState>(
        builder: (context, state) {
      return FormDropDown(
        currentValue: currentValue == "" ? list.first : currentValue,
        list: list,
        onChanged: (String? value) {
          // setState(() {
          //   currentValue = value!;
          // });
          BlocProvider.of<FormDropDownBloc>(
            context,
            listen: false,
          ).dropDownValue = value!;
          BlocProvider.of<FormDropDownBloc>(context)
              .add(SelectDropDownValueEvent());
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
    });
  }
}
