import 'package:calentre/app/create_events/presentation/widget/platform_drop_down.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/button.dart';
import 'package:calentre/shared/form_drop_down/bloc/form_drop_down_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateEventFormFields extends StatefulWidget {
  const CreateEventFormFields({super.key});

  @override
  State<CreateEventFormFields> createState() => _CreateEventFormFieldsState();
}

class _CreateEventFormFieldsState extends State<CreateEventFormFields> {
  @override
  Widget build(BuildContext context) {
    ///returns multiple instance of the FormDropDownBloc and differentiates
    ///them with the valueKey()
    return MultiBlocProvider(
      providers: [
        BlocProvider<FormDropDownBloc>(
            key: const ValueKey("platformDropDown"),
            create: (context) => FormDropDownBloc())
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
                            // const FormDropDown()
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
                      "Payment",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontWeight: FontWeight.w100),
                    ),
                    const SizedBox().y10(),
                    // const FormDropDown()
                  ],
                ),
                const SizedBox().y20(),
                const SizedBox().y10(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Amount",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                    const SizedBox().y10(),
                    TextFormField(
                      initialValue: "\$5",
                      readOnly: true,
                      decoration: const InputDecoration(
                        filled: true,
                      ),
                      cursorColor: AppColors.foundation.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox().y20(),
          const SizedBox().y10(),
          AppButton(title: "Create Event", gradient: true, onPressed: () {})
        ],
      ),
    );
  }
}
