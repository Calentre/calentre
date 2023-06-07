import 'package:calentre/config/theme/colors.dart';
import 'package:flutter/material.dart';

class FormDropDown extends StatefulWidget {
  const FormDropDown({super.key});

  @override
  State<FormDropDown> createState() => _FormDropDownState();
}

class _FormDropDownState extends State<FormDropDown> {
  String dropdownValue = "";
  List<String> list = <String>["zoom", "Google Meet", "Teams"];
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      padding: const EdgeInsets.only(right: 24),
      borderRadius: BorderRadius.circular(2),
      autofocus: true,
      iconEnabledColor: Colors.transparent,
      focusColor: AppColors.grey.s850,
      dropdownColor: AppColors.grey.s700,
      value: list.first,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: TextStyle(color: AppColors.foundation.white),
      underline: Container(
        height: 2,
        color: AppColors.grey.s850,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
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
