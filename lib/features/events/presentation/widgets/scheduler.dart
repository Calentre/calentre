import 'package:calentre/config/enums/time_slots.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/set_availability_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/set_availability_event.dart';
import 'package:calentre/features/events/presentation/bloc/set_availability_state.dart';
import 'package:calentre/features/events/presentation/widgets/time_drop_down.dart';
import 'package:calentre/features/events/presentation/pages/set_availability_view.dart';
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
                          value: BlocProvider.of<SetAvailabilityBloc>(
                            context,
                          ).checkBoxState,
                          onChanged: (bool? value) {
                            debugPrint("The value is $value");
                            BlocProvider.of<SetAvailabilityBloc>(
                              context,
                            ).add(CheckBoxEvent());
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
              BlocProvider.of<SetAvailabilityBloc>(
                context,
              ).checkBoxState
                  ? Expanded(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: (isFirstElement ?? false) &&
                                  BlocProvider.of<SetAvailabilityBloc>(
                                    context,
                                  ).checkBoxState
                              ? const Text("Sart")
                              : Container(),
                        ),
                        BlocProvider.of<SetAvailabilityBloc>(
                          context,
                        ).checkBoxState
                            ? TimeDropDown(
                                day: {"day": day, "index": 0},
                                timeSlotBoundary: TimeSlotBoundary.start)
                            : const Center(child: Text("Busy ")),
                        ...List.generate(
                            BlocProvider.of<SetAvailabilityBloc>(
                              context,
                            ).listLength,
                            (index) => Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: TimeDropDown(
                                      day: {"day": day, "index": index + 1},
                                      timeSlotBoundary: TimeSlotBoundary.start),
                                ))
                      ],
                    ))
                  : const SizedBox(
                      // color: Colors.white,
                      height: 44,
                      width: 400,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 20,
                            child: Text("Busy day for you"),
                          )
                        ],
                      ),
                    ),
              const SizedBox().x14(),
              BlocProvider.of<SetAvailabilityBloc>(
                context,
              ).checkBoxState
                  ? Expanded(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: (isFirstElement ?? false) &&
                                  BlocProvider.of<SetAvailabilityBloc>(
                                    context,
                                  ).checkBoxState
                              ? const Text("End")
                              : Container(),
                        ),
                        BlocProvider.of<SetAvailabilityBloc>(
                          context,
                        ).checkBoxState
                            ? TimeDropDown(
                                day: {"day": day, "index": 0},
                                timeSlotBoundary: TimeSlotBoundary.end,
                              )
                            : const Center(child: Text("Busy")),
                        // ... extraTimeFieldList.map((e) => const TimeDropDown()),
                        ...List.generate(
                            BlocProvider.of<SetAvailabilityBloc>(
                              context,
                            ).listLength,
                            (index) => Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: TimeDropDown(
                                      day: {"day": day, "index": index + 1},
                                      timeSlotBoundary: TimeSlotBoundary.end),
                                ))
                      ],
                    ))
                  : Container(),
              const SizedBox().x14(),
              Column(
                children: [
                  actionIcons(context, index: null, day: day),
                  ...List.generate(
                      BlocProvider.of<SetAvailabilityBloc>(
                        context,
                      ).listLength, (index) {
                    return actionIcons(context,
                        index: index,
                        day: day,
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

  Widget actionIcons(context,
      {required int? index, int? listLength, required String day}) {
    return ((index ?? -1) >= 0 ||
            BlocProvider.of<SetAvailabilityBloc>(
                  context,
                ).checkBoxState ==
                false)
        ? Container()
        : Padding(
            padding: EdgeInsets.only(top: (isFirstElement ?? false) ? 40 : 20),
            child: Row(
              children: [
                //ADD NEW TIME FIELD
                InkWell(
                    onTap: () {
                      debugPrint("Added a new filed");
                      //Signal the bloc for an event
                      BlocProvider.of<SetAvailabilityBloc>(
                        context,
                      ).add(AddExtraTimeFieldEvent());
                      //Add an initial TimeSlot for the new field
                      switch (day) {
                        case "Mon":
                          BlocProvider.of<CalentreEventBloc>(context)
                              .days
                              .monday!
                              .add(
                                  CalTimeSlot(start: "12 AM", end: "11:50 PM"));
                          break;
                        case "Tue":
                          BlocProvider.of<CalentreEventBloc>(context)
                              .days
                              .tuesday!
                              .add(
                                  CalTimeSlot(start: "12 AM", end: "11:50 PM"));
                          break;
                        case "Wed":
                          BlocProvider.of<CalentreEventBloc>(context)
                              .days
                              .wednesday!
                              .add(
                                  CalTimeSlot(start: "12 AM", end: "11:50 PM"));
                          break;
                        case "Thur":
                          BlocProvider.of<CalentreEventBloc>(context)
                              .days
                              .thursday!
                              .add(
                                  CalTimeSlot(start: "12 AM", end: "11:50 PM"));
                          break;
                        case "Fri":
                          BlocProvider.of<CalentreEventBloc>(context)
                              .days
                              .friday!
                              .add(
                                  CalTimeSlot(start: "12 AM", end: "11:50 PM"));
                          break;
                        case "Sat":
                          BlocProvider.of<CalentreEventBloc>(context)
                              .days
                              .saturday!
                              .add(
                                  CalTimeSlot(start: "12 AM", end: "11:50 PM"));
                          break;
                        case "Sun":
                          BlocProvider.of<CalentreEventBloc>(context)
                              .days
                              .sunday!
                              .add(
                                  CalTimeSlot(start: "12 AM", end: "11:50 PM"));
                          break;
                        default:
                      }
                    },
                    child: const FaIcon(FontAwesomeIcons.solidSquarePlus)),
                const SizedBox().x14(),

                //REMOVE LAST TIME FIELD
                InkWell(
                    onTap: BlocProvider.of<SetAvailabilityBloc>(
                              context,
                            ).listLength ==
                            0
                        ? null
                        : () {
                            debugPrint("Removed a new filled");

                            BlocProvider.of<SetAvailabilityBloc>(
                              context,
                            ).add(RemoveExtraTimeFieldEvent());

                            //You should come back to add a caseSwitch here to know day to act on.
                            switch (day) {
                              case "Mon":
                                BlocProvider.of<CalentreEventBloc>(context)
                                    .days
                                    .monday!
                                    .removeLast();
                                break;
                              case "Tue":
                                BlocProvider.of<CalentreEventBloc>(context)
                                    .days
                                    .tuesday!
                                    .removeLast();
                                break;
                              case "Wed":
                                BlocProvider.of<CalentreEventBloc>(context)
                                    .days
                                    .wednesday!
                                    .removeLast();
                                break;
                              case "Thur":
                                BlocProvider.of<CalentreEventBloc>(context)
                                    .days
                                    .thursday!
                                    .removeLast();
                                break;
                              case "Fri":
                                BlocProvider.of<CalentreEventBloc>(context)
                                    .days
                                    .friday!
                                    .removeLast();
                                break;
                              case "Sat":
                                BlocProvider.of<CalentreEventBloc>(context)
                                    .days
                                    .saturday!
                                    .removeLast();
                                break;
                              case "Sun":
                                BlocProvider.of<CalentreEventBloc>(context)
                                    .days
                                    .sunday!
                                    .removeLast();
                                break;
                              default:
                            }
                          },
                    child: FaIcon(
                      FontAwesomeIcons.trash,
                      color: BlocProvider.of<SetAvailabilityBloc>(
                                context,
                              ).listLength ==
                              0
                          ? Colors.white.withOpacity(.2)
                          : Colors.white,
                    )),
              ],
            ),
          );
  }
}
