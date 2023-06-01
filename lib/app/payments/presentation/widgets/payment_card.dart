import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/border_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BorderCard(
        verticalPadding: 24,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(FontAwesomeIcons.paypal),
                  const SizedBox().x10(),
                  Text(
                    "\$5",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox().x10(),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.circle,
                    color: AppColors.foundation.error,
                  ),
                  Switch(
                    // This bool value toggles the switch.
                    value: false,
                    activeColor: Colors.red,
                    onChanged: (bool value) {
                      // This is called when the user toggles the switch.
                    },
                  ),
                  const FaIcon(FontAwesomeIcons.trash)
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
