import 'package:calentre/config/enums/time_slots.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/set_availability_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/set_availability_event.dart';
import 'package:calentre/features/events/presentation/bloc/set_availability_state.dart';
import 'package:calentre/features/events/presentation/helpers/add_extra_time_field.dart';
import 'package:calentre/features/events/presentation/helpers/remove_extra_time_field.dart';
import 'package:calentre/features/events/presentation/widgets/time_drop_down.dart';
import 'package:calentre/features/events/presentation/pages/set_availability_view.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/utils/element_color_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AvailabilityScheduler extends StatelessWidget {
  AvailabilityScheduler({super.key, this.isFirstElement, required this.day});
  final bool? isFirstElement;
  final String day;
  final List extraTimeFieldList = [];

  @override
  Widget build(BuildContext context) {
    //ok to leave bloc here since it's a singleton.
    CalentreEventBloc calentreEventBloc = BlocProvider.of<CalentreEventBloc>(
      context,
    );
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
                          fillColor: MaterialStateProperty.resolveWith(
                              elementColorSelector),
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
                            ? Column(
                                children: [
                                  TimeDropDown(
                                      day: {"day": day, "index": 0},
                                      timeSlotBoundary: TimeSlotBoundary.start),
                                  ((calentreEventBloc.currentDay == day)
                                      ? (checkError(day, context, 0)
                                          ? const Text("There was an error ")
                                          : Container())
                                      : Container()),
                                ],
                              )
                            : const Center(child: Text("Busy ")),
                        ...List.generate(
                            BlocProvider.of<SetAvailabilityBloc>(
                              context,
                            ).listLength,
                            (index) => Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Column(
                                    children: [
                                      TimeDropDown(
                                          //adding 1 because the index starts at 0
                                          day: {
                                            "day": day,
                                            "index": index + 1
                                          },
                                          timeSlotBoundary:
                                              TimeSlotBoundary.start),
                                      ((calentreEventBloc.currentDay == day)
                                          ? (checkError(day, context, index + 1)
                                              ? const Text(
                                                  "There was an error ")
                                              : Container())
                                          : Container())
                                    ],
                                  ),
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
                            ? Column(
                                children: [
                                  TimeDropDown(
                                      day: {"day": day, "index": 0},
                                      timeSlotBoundary: TimeSlotBoundary.end),
                                  ((calentreEventBloc.currentDay == day)
                                      ? (checkError(day, context, 0)
                                          ? const Text(" ")
                                          : Container())
                                      : Container())
                                ],
                              )
                            : const Center(child: Text("Busy")),
                        ...List.generate(
                            BlocProvider.of<SetAvailabilityBloc>(
                              context,
                            ).listLength,
                            (index) => Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Column(
                                    children: [
                                      TimeDropDown(
                                          //adding 1 because the index starts at 0
                                          day: {
                                            "day": day,
                                            "index": index + 1
                                          },
                                          timeSlotBoundary:
                                              TimeSlotBoundary.end),
                                      ((calentreEventBloc.currentDay == day)
                                          ? (checkError(day, context, index + 1)
                                              ? const Text(" ")
                                              : Container())
                                          : Container())
                                    ],
                                  ),
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
                      addExtraTimeFieldHelper(
                          day: day,
                          calentreEventBloc:
                              BlocProvider.of<CalentreEventBloc>(context),
                          context: context,
                          index: index ?? 1);
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
                            removeExtraTimeFieldHelper(
                                day: day,
                                calentreEventBloc:
                                    BlocProvider.of<CalentreEventBloc>(
                                        context));
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

//index represent the extra timefield value.
bool checkError(String day, BuildContext context, int index) {
  switch (day) {
    case "Mon":
      bool error = BlocProvider.of<CalentreEventBloc>(context).errorList[0]
          ["Mon"]![index];
      return error;
    case "Tue":
      bool error = BlocProvider.of<CalentreEventBloc>(context).errorList[1]
          ["Tue"]![index];
      return error;
    case "Wed":
      bool error = BlocProvider.of<CalentreEventBloc>(context).errorList[2]
          ["Wed"]![index];
      return error;
    case "Thur":
      bool error = BlocProvider.of<CalentreEventBloc>(context).errorList[3]
          ["Thur"]![index];
      return error;
    case "Fri":
      bool error = BlocProvider.of<CalentreEventBloc>(context).errorList[4]
          ["Fri"]![index];
      return error;
    case "Sat":
      bool error = BlocProvider.of<CalentreEventBloc>(context).errorList[5]
          ["Sat"]![index];
      return error;
    case "Sun":
      bool error = BlocProvider.of<CalentreEventBloc>(context).errorList[6]
          ["Sun"]![index];
      return error;

    default:
      return false;
  }
}
