import 'package:animate_gradient/animate_gradient.dart';
import 'package:calentre/features/payments/presentation/widgets/currency_type_drop_down.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/widgets/border_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class AddPaymentDetailsModal extends StatelessWidget {
  const AddPaymentDetailsModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimateGradient(
        primaryBegin: Alignment.topLeft,
        primaryEnd: Alignment.bottomLeft,
        secondaryBegin: Alignment.bottomLeft,
        secondaryEnd: Alignment.topRight,
        primaryColors: [
          AppColors.grey.s950,
          AppColors.gradient.g031,
          AppColors.grey.s950,
        ],
        secondaryColors: [
          AppColors.grey.s950,
          AppColors.gradient.g022,
          AppColors.gradient.g012,
        ],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: Text(
                  "Start Charging for your time!",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontWeight: FontWeight.w900, fontSize: 95),
                ),
              ),
              BorderCard(
                  horizontalPadding: 12,
                  verticalPadding: 24,
                  width: 400,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                context.pop();
                              },
                              child: const FaIcon(
                                  FontAwesomeIcons.circleChevronLeft)),
                          const Text("Add Payment Details"),
                          Container(
                            width: 24,
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: AppColors.accent.purpleMute,
                        ),
                        child: Text(
                          "We only support direct transfers for all payment methods at the moment.",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: AppColors.grey.s950),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select Currency",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(fontWeight: FontWeight.w100),
                          ),
                          const SizedBox().y10(),
                          const Material(child: CurrencyTypeDropDown())
                        ],
                      ),
                      Column(
                        // mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox().y20(),
                          const SizedBox().y10(),
                          Text(
                            "Account Number",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(fontWeight: FontWeight.normal),
                          ),
                          const SizedBox().y10(),
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: "0123456789",
                              filled: true,
                            ),
                            cursorColor: AppColors.foundation.white,
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
