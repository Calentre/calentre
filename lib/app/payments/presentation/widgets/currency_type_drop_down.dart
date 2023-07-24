import 'package:calentre/shared/form_drop_down/form_drop_down.dart';
import 'package:flutter/material.dart';

class CurrencyTypeDropDown extends StatefulWidget {
  const CurrencyTypeDropDown({super.key});

  @override
  State<CurrencyTypeDropDown> createState() => _CurrencyTypeDropDownState();
}

class _CurrencyTypeDropDownState extends State<CurrencyTypeDropDown> {
  String currentValue = "";
  @override
  Widget build(BuildContext context) {
    List<String> list = <String>["NGN", "USD"];

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
          child: Row(
            children: [
              Text(value),
            ],
          ),
        );
      }).toList(),
    );
  }
}
