import 'package:calentre/config/constraints/constraints.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: WebConstraints.maxWidth),
          // width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 24),

          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppButton(
                  gradient: true,
                  title: "Events",
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.calendarDay,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox().x10(),
              Expanded(
                child: AppButton(
                  title: "History",
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.userClock,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox().x10(),
              Expanded(
                child: AppButton(
                  title: "Payments",
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.creditCard,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.grey.s700,
                  width: 1.0,
                ),
              ),
            ))
      ],
    );
  }
}
