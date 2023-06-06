import 'package:calentre/app/create_events/presentation/widget/video_call_type_drop_down.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:flutter/material.dart';

class CreateEventFormFields extends StatelessWidget {
  const CreateEventFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                            "Video Call type",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(fontWeight: FontWeight.w100),
                          ),
                          const SizedBox().y10(),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Select",
                              filled: true,
                            ),
                            cursorColor: AppColors.foundation.white,
                          ),
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
                          TextFormField(
                            decoration: const InputDecoration(
                              suffix: SizedBox(child: FormDropDown()),
                              hintText: "Select",
                              filled: true,
                            ),
                            cursorColor: AppColors.foundation.white,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
