import 'package:calentre/app/create_events/presentation/widget/form_drop_down.dart';
import 'package:flutter/material.dart';

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

    return FormDropDown(
      currentValue: currentValue == "" ? list.first : currentValue,
      list: list,
      onChanged: (String? value) {
        setState(() {
          currentValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
