import 'package:calentre/config/enums/time_slots.dart';
import 'package:calentre/config/enums/weekdays.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_state.dart';
import 'package:calentre/features/events/presentation/bloc/set_availability_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/set_availability_event.dart';
import 'package:calentre/features/events/presentation/bloc/set_availability_state.dart';
import 'package:calentre/features/events/presentation/helpers/add_new_time_field.dart';
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
  final WeekDays day;
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
                        Text(day.name.toString().substring(0, 3).toUpperCase()),
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
                            ? BlocBuilder<CalentreEventBloc,
                                CalentreEventBaseState>(
                                builder: (context, state) {
                                  return Column(
                                    children: [
                                      TimeDropDown(
                                          day: {"day": day, "index": 0},
                                          timeSlotBoundary:
                                              TimeSlotBoundary.start),
                                      state is DayScheduleValidationState &&
                                              state.day == day &&
                                              checkError(
                                                day,
                                                state,
                                                0,
                                                context,
                                              )
                                          ? const Text("There was an error ")
                                          : Container()
                                    ],
                                  );
                                },
                              )
                            : const Center(child: Text("Busy ")),
                        ...List.generate(
                            BlocProvider.of<SetAvailabilityBloc>(
                              context,
                            ).listLength,
                            (index) => Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: BlocBuilder<CalentreEventBloc,
                                      CalentreEventBaseState>(
                                    builder: (context, state) {
                                      return Column(
                                        children: [
                                          TimeDropDown(
                                              day: {
                                                "day": day,
                                                "index": index + 1
                                              },
                                              timeSlotBoundary:
                                                  TimeSlotBoundary.start),
                                          state is DayScheduleValidationState &&
                                                  state.day == day &&
                                                  checkError(
                                                    day,
                                                    state,
                                                    index + 1,
                                                    context,
                                                  )
                                              ? const Text(
                                                  "There was an error ")
                                              : Container()
                                        ],
                                      );
                                    },
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
                                  // ((calentreEventBloc.currentDay == day)
                                  //     ? (checkError(day.toString(), context, 0)
                                  //         ? const Text(" ")
                                  //         : Container())
                                  //     : Container())
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
                                      // ((calentreEventBloc.currentDay ==
                                      //         day.toString())
                                      //     ? (checkError(day.toString(), context,
                                      //             index + 1)
                                      //         ? const Text(" ")
                                      //         : Container())
                                      //     : Container())
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
      {required int? index, int? listLength, required WeekDays day}) {
    CalentreEventBloc calentreEventBloc = BlocProvider.of<CalentreEventBloc>(
      context,
    );
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
                      calentreEventBloc.add(AddNewTimeFieldEvent(day: day));

                      //Add an initial TimeSlot for the new field
                      // addExtraTimeFieldHelper(
                      //     day: day,
                      //     calentreEventBloc:
                      //         BlocProvider.of<CalentreEventBloc>(context),
                      //     context: context,
                      //     index: index ?? 1);
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

                            calentreEventBloc
                                .add(RemoveTimeFieldEvent(day: day));

                            //You should come back to add a caseSwitch here to know day to act on.
                            // removeExtraTimeFieldHelper(
                            //     day: day,
                            //     calentreEventBloc:
                            //         BlocProvider.of<CalentreEventBloc>(
                            //             context));
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
bool checkError(WeekDays day, DayScheduleValidationState state, int index,
    BuildContext context) {
  CalentreEventBloc calentreEventBloc = BlocProvider.of<CalentreEventBloc>(
    context,
  );
  switch (day) {
    case WeekDays.monday:
      bool error = state.errorList[0][WeekDays.monday]![index];
      if (error) {
        //add new event to update errorList of this particular day and emit DayScheduleValidationState
        calentreEventBloc
            .add(UpdateDayScheduleValidationEvent(errorList: state.errorList));
      }
      return error;
    case WeekDays.tuesday:
      bool error = state.errorList[1][WeekDays.tuesday]![index];
      return error;
    case WeekDays.wednesday:
      bool error = state.errorList[2][WeekDays.wednesday]![index];
      return error;
    case WeekDays.thursday:
      bool error = state.errorList[3][WeekDays.thursday]![index];
      return error;
    case WeekDays.friday:
      bool error = state.errorList[4][WeekDays.friday]![index];
      return error;
    case WeekDays.saturday:
      bool error = state.errorList[5][WeekDays.saturday]![index];
      return error;
    case WeekDays.sunday:
      bool error = state.errorList[6][WeekDays.sunday]![index];
      return error;

    default:
      return false;
  }
}
