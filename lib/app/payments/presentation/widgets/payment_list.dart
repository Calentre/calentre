import 'package:calentre/app/payments/presentation/widgets/add_payment_modal.dart';
import 'package:calentre/app/payments/presentation/widgets/payment_card.dart';
import 'package:calentre/config/constraints/max_width_container.dart';
import 'package:calentre/config/enums/button_size.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/routes/routes.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                    "Payment Methods",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  AppButton(
                    title: "+ Add Payment Method",
                    size: ButtonSize.small,
                    textColor: AppColors.grey.s950,
                    color: AppColors.foundation.white,
                    onPressed: () async {
                      await addPaymentModal(context);
                      // context.goNamed(AppRoutes.addPaymentModal);
                    },
                  )
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
