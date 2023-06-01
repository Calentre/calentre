import 'package:calentre/app/history/presentation/widget/history_card.dart';
import 'package:calentre/app/payments/presentation/widgets/payment_card.dart';
import 'package:calentre/config/constraints/max_width_container.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:flutter/material.dart';

class PaymentList extends StatelessWidget {
  const PaymentList({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return WebContainer(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "All History",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
              const SizedBox().y20(),
              const PaymentCard(),
              const SizedBox().y20(),
              const PaymentCard(),
              const SizedBox().y20(),
              const PaymentCard(),
              const SizedBox().y20(),
              const PaymentCard(),
            ],
          ),
        ),
      );
    });
  }
}
