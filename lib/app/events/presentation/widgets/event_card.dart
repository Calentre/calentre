import 'package:calentre/config/enums/button_size.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/border_card.dart';
import 'package:calentre/shared/button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BorderCard(
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
                            "\$4,000",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        const SizedBox().y4(),
                        const Text("30mins"),
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
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("The Coach Training Live session"),
                      Text("No Description"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Copy Link"),
                          Row(
                            children: [
                              AppButton(
                                title: "+ New Event",
                                size: ButtonSize.small,
                                onPressed: () {},
                              ),
                              const SizedBox().x4(),
                              AppButton(
                                title: "+ New Event",
                                size: ButtonSize.small,
                                icon: FaIcon(FontAwesomeIcons.handDots),
                                onPressed: () {},
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
