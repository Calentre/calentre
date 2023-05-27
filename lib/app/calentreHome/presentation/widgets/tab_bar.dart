import 'package:calentre/config/constraints/constraints.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.grey.s700,
            width: 1.0,
          ),
        ),
      ),
      child: Container(
        color: Colors.amber,
        constraints: BoxConstraints(maxWidth: WebConstraints.maxWidth / 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AppButton(
                title: "Events",
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.calendarDay),
              ),
            ),
            Expanded(
              child: AppButton(
                title: "Events",
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.calendarDay),
              ),
            ),
            Expanded(
              child: AppButton(
                title: "Events",
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.calendarDay),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
