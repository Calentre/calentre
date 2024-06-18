import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/widgets/border_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BorderCard(
        verticalPadding: 24,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                        Text(
                          "2023",
                          style: TextStyle(color: AppColors.grey.s500),
                        ),
                        const SizedBox().y4(),
                        Container(
                          constraints: const BoxConstraints(
                            minWidth: 96,
                            maxWidth: 108,
                          ),
                          child: Text(
                            "30th",
                            style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox().y4(),
                        Text(
                          "Sept",
                          style: TextStyle(color: AppColors.grey.s500),
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
                        "Wola Kin",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Text("30mins - Life Coaching and meeting"),
                      const Text("WolaKin@gmail.com")
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  const FaIcon(FontAwesomeIcons.paypal),
                  const SizedBox().x10(),
                  Text(
                    "\$5",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox().x10(),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
