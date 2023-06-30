import 'package:calentre/app/set_availability/presentation/set_availability_view.dart';
import 'package:calentre/app/set_availability/presentation/widgets/time_drop_down.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AvailabilityScheduler extends StatelessWidget {
  const AvailabilityScheduler({super.key});

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text("Day"),
            ),
            FormBorderCard(
              verticalPadding: 8,
              leftPadding: 12,
              width: 100,
              child: Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: true,
                    onChanged: (bool? value) {
                      // setState(() {
                      //   isChecked = value!;
                      // });
                    },
                  ),
                  const Text("Mon"),
                  const SizedBox().x10(),
                ],
              ),
            ),
          ],
        ),
        const SizedBox().x14(),
        const Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text("Start"),
            ),
            TimeDropDown()
          ],
        )),
        const SizedBox().x14(),
        const Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text("End"),
            ),
            TimeDropDown()
          ],
        )),
        const SizedBox().x14(),
        const Padding(
          padding: EdgeInsets.only(top: 18),
          child: FaIcon(FontAwesomeIcons.solidSquarePlus),
        ),
        const SizedBox().x14(),
        const Padding(
          padding: EdgeInsets.only(top: 18),
          child: FaIcon(FontAwesomeIcons.trash),
        ),
      ],
    );
  }
}
