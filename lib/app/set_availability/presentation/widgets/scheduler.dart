import 'package:calentre/app/set_availability/presentation/bloc/set_availability_bloc.dart';
import 'package:calentre/app/set_availability/presentation/bloc/set_availability_event.dart';
import 'package:calentre/app/set_availability/presentation/bloc/set_availability_state.dart';
import 'package:calentre/app/set_availability/presentation/set_availability_view.dart';
import 'package:calentre/app/set_availability/presentation/widgets/time_drop_down.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AvailabilityScheduler extends StatelessWidget {
  AvailabilityScheduler({super.key});

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

  final List extraTimeFieldList = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SetAvailabilityBloc>(
        create: (context) => SetAvailabilityBloc(),
        child: BlocBuilder<SetAvailabilityBloc, SetAvailabilityStates>(
            builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
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
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text("Start"),
                  ),
                  const TimeDropDown(),
                  ...List.generate(
                      BlocProvider.of<SetAvailabilityBloc>(
                        context,
                      ).listLength,
                      (index) => const TimeDropDown())
                ],
              )),
              const SizedBox().x14(),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text("End"),
                  ),
                  const TimeDropDown(),
                  // ... extraTimeFieldList.map((e) => const TimeDropDown()),
                  ...List.generate(
                      BlocProvider.of<SetAvailabilityBloc>(
                        context,
                      ).listLength,
                      (index) => const TimeDropDown())
                ],
              )),
              const SizedBox().x14(),
              Column(
                children: [
                  actionIcons(context, index: null),
                  ...List.generate(
                      BlocProvider.of<SetAvailabilityBloc>(
                        context,
                      ).listLength, (index) {
                    return actionIcons(context,
                        index: index,
                        listLength: BlocProvider.of<SetAvailabilityBloc>(
                          context,
                        ).listLength);
                  })
                ],
              ),
            ],
          );
        }));
  }

  Widget actionIcons(context, {required int? index, int? listLength}) {
    return ((index ?? -1) >= 0)
        ? Container()
        : Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      debugPrint("Added a new filed");

                      BlocProvider.of<SetAvailabilityBloc>(
                        context,
                      ).add(AddExtraTimeFieldEvent());
                    },
                    child: const FaIcon(FontAwesomeIcons.solidSquarePlus)),
                const SizedBox().x14(),
                InkWell(
                    onTap: () {
                      debugPrint("Removed a new filled");

                      BlocProvider.of<SetAvailabilityBloc>(
                        context,
                      ).add(RemoveExtraTimeFieldEvent());
                    },
                    child: const FaIcon(FontAwesomeIcons.trash)),
              ],
            ),
          );
  }
}
