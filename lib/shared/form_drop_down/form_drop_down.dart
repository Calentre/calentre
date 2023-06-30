import 'package:calentre/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class FormDropDown extends StatefulWidget {
  FormDropDown(
      {super.key,
      required this.list,
      required this.onChanged,
      required this.items,
      required this.currentValue});

  final List<String> list;
  final void Function(String?)? onChanged;
  final List<DropdownMenuItem<String>> items;
  String currentValue;

  @override
  State<FormDropDown> createState() => _FormDropDownState();
}

class _FormDropDownState extends State<FormDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          color: AppColors.grey.s900,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: AppColors.grey.s500)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: DropdownButton<String>(
            padding: const EdgeInsets.only(right: 24),
            borderRadius: BorderRadius.circular(2),
            autofocus: true,
            iconEnabledColor: Colors.transparent,
            focusColor: AppColors.grey.s850,
            dropdownColor: AppColors.grey.s850,
            value: widget.currentValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: TextStyle(color: AppColors.foundation.white),
            underline: Container(
              height: 2,
              color: Colors.transparent,
            ),
            onChanged: widget.onChanged,
            items: widget.items,
          )),
          const FaIcon(FontAwesomeIcons.circleChevronDown)
        ],
      ),
    );
  }
}


// widget.list.map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList()