import 'package:calentre/features/events/presentation/bloc/duration_drop_down_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_event.dart';
import 'package:calentre/features/events/presentation/bloc/event_type_drop_down_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/platform_drop_down_bloc.dart';
import 'package:calentre/features/events/presentation/widgets/duration_drop_down.dart';
import 'package:calentre/features/events/presentation/widgets/event_type_drop_down.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/routes/routes.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/features/events/presentation/widgets/multi_booking_drop_down.dart';
import 'package:calentre/shared/widgets/button.dart';
import 'package:calentre/shared/widgets/form_drop_down/bloc/form_drop_down_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'platform_drop_down.dart';

class CreateEventFormFields extends StatefulWidget {
  const CreateEventFormFields({super.key});

  @override
  State<CreateEventFormFields> createState() => _CreateEventFormFieldsState();
}

class _CreateEventFormFieldsState extends State<CreateEventFormFields> {
  //TextControllers
  final eventNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final meetingLinkController = TextEditingController();
  String platformValue = "Google meet";
  String durationValue = "5 min";
  String eventTypeValue = "Free";

  @override
  Widget build(BuildContext context) {
    final calentreEventBloc = BlocProvider.of<CalentreEventBloc>(context);

    return MultiBlocListener(
      listeners: [
        BlocListener<PlatformDropDownBloc, FormDropDownState>(
          listener: (context, state) {
            if (state is FormDropDownUpdatedState) {
              platformValue = state.value;
            }
          },
        ),
        BlocListener<DurationDropDownBloc, FormDropDownState>(
          listener: (context, state) {
            if (state is FormDropDownUpdatedState) {
              durationValue = state.value;
            }
          },
        ),
        BlocListener<EventTypeDropDownBloc, FormDropDownState>(
          listener: (context, state) {
            if (state is FormDropDownUpdatedState) {
              eventTypeValue = state.value;
            }
          },
        ),
      ],
      child: Column(
        children: [
          Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Event Name",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    const SizedBox().y10(),
                    TextFormField(
                      controller: eventNameController,
                      decoration: const InputDecoration(
                        hintText: "Enter Event Name",
                        filled: true,
                      ),
                      cursorColor: AppColors.foundation.white,
                    ),
                  ],
                ),
                const SizedBox().y20(),
                const SizedBox().y10(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description (Optional)",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontWeight: FontWeight.w100),
                    ),
                    const SizedBox().y10(),
                    TextFormField(
                      controller: descriptionController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: "What's your event about?",
                        filled: true,
                      ),
                      cursorColor: AppColors.foundation.white,
                    ),
                  ],
                ),
                const SizedBox().y20(),
                const SizedBox().y10(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Platform",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(fontWeight: FontWeight.w100),
                            ),
                            const SizedBox().y10(),
                            const PlatformDropDown()
                          ],
                        ),
                      ),
                    ),
                    const SizedBox().x10(),
                    Expanded(
                      child: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Duration",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(fontWeight: FontWeight.w100),
                            ),
                            const SizedBox().y10(),
                            const DurationDropDown()
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox().y20(),
                const SizedBox().y10(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Meeting Link",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    const SizedBox().y10(),
                    TextFormField(
                      // controller: meetingLinkController,
                      initialValue: "https://calentre.com/LilYatchy",
                      readOnly: true,
                      decoration: const InputDecoration(
                        filled: true,
                      ),
                      cursorColor: AppColors.foundation.white,
                    ),
                  ],
                ),
                const SizedBox().y20(),
                const SizedBox().y10(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Event Type",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontWeight: FontWeight.w100),
                    ),
                    const SizedBox().y10(),
                    const EventTypeDropDown()
                  ],
                ),
                BlocBuilder<EventTypeDropDownBloc, FormDropDownState>(
                    builder: (context, state) {
                  debugPrint("Event type rebuild");
                  debugPrint('$state');
                  final bloc = (BlocProvider.of<EventTypeDropDownBloc>(
                    context,
                  ));
                  if (state is FormDropDownInitialState ||
                      bloc.dropDownValue == "Free") {
                    return Container();
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox().y20(),
                        const SizedBox().y10(),
                        Text(
                          "Amount (USD)",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                        const SizedBox().y10(),
                        TextFormField(
                          initialValue: "\$5",
                          decoration: const InputDecoration(
                            filled: true,
                          ),
                          cursorColor: AppColors.foundation.white,
                        ),
                      ],
                    );
                  }
                }),
                const SizedBox().y20(),
                const SizedBox().y10(),
                Opacity(
                  opacity: .5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Allow Mutiple Time Slot booking?",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(fontWeight: FontWeight.w100),
                      ),
                      const SizedBox().y10(),
                      const MultiBookingDropDown(),
                      const Text("This feature is coming soon")
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox().y20(),
          const SizedBox().y10(),
          AppButton(
              title: "Set Availability",
              gradient: true,
              onPressed: () {
                calentreEventBloc.add(UpdateCalentreEventDetailsEvent(
                    eventName: eventNameController.text,
                    eventDescription: descriptionController.text,
                    platformType: platformValue,
                    duration: durationValue,
                    eventType: eventTypeValue,
                    eventLink: meetingLinkController.text));

                context.pushNamed(AppRoutes.setAvailabilityView);
              })
        ],
      ),
    );
  }
}
