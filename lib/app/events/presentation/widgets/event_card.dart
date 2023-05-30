import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/border_card.dart';
import 'package:flutter/material.dart';

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
                  maxWidth: 138,
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
                            "\$ 400",
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
              Text("Massive Shit")
            ],
          ),
        ),
      );
    });
  }
}
