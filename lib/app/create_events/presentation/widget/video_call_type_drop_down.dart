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
      value: list.first,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
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
