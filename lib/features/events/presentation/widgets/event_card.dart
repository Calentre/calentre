import 'package:calentre/config/enums/button_size.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/features/events/data/data_sources/event_service.dart';
import 'package:calentre/shared/border_card.dart';
import 'package:calentre/shared/button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:web_toast/web_toast.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BorderCard(
        verticalPadding: 12,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Container(
                constraints: const BoxConstraints(
                  minWidth: 96,
                  maxWidth: 118,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                            constraints: const BoxConstraints(
                              minWidth: 96,
                              maxWidth: 108,
                            ),
                            child: Text(
                              "\$10",
                              // "Free",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: 20),
                            )),
                        const SizedBox().y4(),
                        Text(
                          "30mins",
                          style: TextStyle(color: AppColors.grey.s500),
                        ),
                        const SizedBox().y4(),
                        Icon(
                          Icons.stop,
                          color: AppColors.foundation.error,
                        ),
                      ],
                    ),
                    Container(
                        height: 70,
                        width: 1,
                        decoration: BoxDecoration(
                          color: AppColors.grey.s700,
                        )),
                  ],
                ),
              ),
              const SizedBox().x10(),
              Expanded(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "The Coach Training Live session",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 20),
                      ),
                      const Text("No Description"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Copy Link"),
                          Row(
                            children: [
                              AppButton(
                                title: "Visit Link",
                                size: ButtonSize.small,
                                icon: const FaIcon(
                                  FontAwesomeIcons.squareArrowUpRight,
                                  size: 16,
                                ),
                                onPressed: () {},
                              ),
                              const SizedBox().x4(),
                              AppButton(
                                title: "Open",
                                size: ButtonSize.small,
                                icon: const Icon(
                                  Icons.more_vert_rounded,
                                  size: 16,
                                ),
                                onPressed: () async {
                                  // await EventService(Supabase.instance.client)
                                  //     .createEvent({});
                                  Toast.success(
                                      title: 'Info',
                                      text: 'Your changes has been saved!',
                                      duration: const Duration(seconds: 3));
                                },
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
