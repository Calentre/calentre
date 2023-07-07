import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/routes/routes.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/border_card.dart';
import 'package:calentre/shared/button.dart';
import 'package:calentre/utils/icon_framer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

Widget eventsEmptyState(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 24),
    child: Center(
      child: BorderCard(
        width: 1024,
        child: Column(
          children: [
            iconFramer(imageTitle: "events-placeholder.svg", size: 300),
            const SizedBox().y20(),
            Text(
              "You have not created any events",
              style: TextStyle(color: AppColors.grey.s300),
              textAlign: TextAlign.center,
            ),
            const SizedBox().y10(),
            AppButton(
              title: "Create Event",
              width: 300,
              gradient: true,
              onPressed: () {
                context.goNamed(AppRoutes.createEvent);
              },
              icon: const FaIcon(
                FontAwesomeIcons.boltLightning,
                color: Colors.amber,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
