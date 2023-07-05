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
  AvailabilityScheduler({super.key, this.isFirstElement, required this.day});
  final bool? isFirstElement;
  final String day;

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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: (isFirstElement ?? false)
                        ? const Text("Day")
                        : Container(),
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
                        Text(day),
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: (isFirstElement ?? false)
                        ? const Text("Sart")
                        : Container(),
                  ),
                  const TimeDropDown(),
                  ...List.generate(
                      BlocProvider.of<SetAvailabilityBloc>(
                        context,
                      ).listLength,
                      (index) => const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: TimeDropDown(),
                          ))
                ],
              )),
              const SizedBox().x14(),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: (isFirstElement ?? false)
                        ? const Text("End")
                        : Container(),
                  ),
                  const TimeDropDown(),
                  // ... extraTimeFieldList.map((e) => const TimeDropDown()),
                  ...List.generate(
                      BlocProvider.of<SetAvailabilityBloc>(
                        context,
                      ).listLength,
                      (index) => const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: TimeDropDown(),
                          ))
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
            padding: EdgeInsets.only(top: (isFirstElement ?? false) ? 40 : 20),
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
                    child: BlocProvider.of<SetAvailabilityBloc>(
                              context,
                            ).listLength ==
                            0
                        ? Container()
                        : const FaIcon(
                            FontAwesomeIcons.trash,
                          )),
              ],
            ),
          );
  }
}
