import 'package:calentre/app/create_events/presentation/bloc/multibooking_drop_down_bloc.dart';
import 'package:calentre/shared/form_drop_down/bloc/form_drop_down_event.dart';
import 'package:calentre/shared/form_drop_down/bloc/form_drop_down_state.dart';
import 'package:calentre/shared/form_drop_down/form_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBookingDropDown extends StatefulWidget {
  const MultiBookingDropDown({super.key});

  @override
  State<MultiBookingDropDown> createState() => _MultiBookingDropDownState();
}

class _MultiBookingDropDownState extends State<MultiBookingDropDown> {
  String currentValue = "";
  @override
  Widget build(BuildContext context) {
    List<String> list = <String>["No", "Yes"];

    return BlocBuilder<MultiBookingDropDownBloc, FormDropDownState>(
        builder: (context, state) {
      return FormDropDown(
        currentValue: BlocProvider.of<MultiBookingDropDownBloc>(context)
                    .dropDownValue ==
                ""
            ? list.first
            : BlocProvider.of<MultiBookingDropDownBloc>(context).dropDownValue,
        list: list,
        onChanged: (String? value) {
          // setState(() {
          //   currentValue = value!;
          // });
          BlocProvider.of<MultiBookingDropDownBloc>(
            context,
            // listen: false,
          ).dropDownValue = value!;
          BlocProvider.of<MultiBookingDropDownBloc>(context)
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
