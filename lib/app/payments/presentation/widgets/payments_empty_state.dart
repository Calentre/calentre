import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/border_card.dart';
import 'package:calentre/shared/button.dart';
import 'package:calentre/utils/icon_framer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentsEmptyState extends StatelessWidget {
  const PaymentsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Center(
        child: BorderCard(
          child: Column(
            children: [
              iconFramer(imageTitle: "payments-placeholder.svg", size: 300),
              const SizedBox().y20(),
              Text(
                "You not added any payments",
                style: TextStyle(color: AppColors.grey.s300),
                textAlign: TextAlign.center,
              ),
              const SizedBox().y10(),
              AppButton(
                title: "Add payments method",
                width: 300,
                gradient: true,
                onPressed: () {},
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
}
