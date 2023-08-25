import 'package:calentre/config/constraints/max_width_container.dart';
import 'package:feature_notifier/feature_notifier.dart';
import 'package:flutter/material.dart';
import 'package:calentre/config/enums/button_size.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/border_card.dart';
import 'package:calentre/shared/button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConfirmPaymentView extends StatelessWidget {
  const ConfirmPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: WebContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox().y20(),
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.circleDot,
                  color: AppColors.foundation.success,
                  size: 18,
                ),
                const SizedBox().x10(),
                Text("Please confirm payment(s) from below",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 16)),
              ],
            ),
            const SizedBox().y10(),
            FeatureBarNotifier(
              title:
                  "We recommend waiting about 30mins before confirming payments.",
              featureKey: 1,
              onClose: () {},
              onTapCard: () {},
              titleColor: AppColors.grey.s950,
              // showIcon: false,
              backgroundColor: AppColors.accent.purpleMute,
              strokeWidth: 0,
              strokeColor: Colors.transparent,
            ),
            const SizedBox().y20(),
            _confirmPaymentCard(context),
          ],
        ),
      ),
    );
  }
}

Widget _confirmPaymentCard(context) {
  return BorderCard(
    verticalPadding: 12,
    color: AppColors.accent.blue,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Container(
            constraints: const BoxConstraints(
              minWidth: 96,
              maxWidth: 118,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10000.0),
                          color: AppColors.grey.s700
                          // gradient: LinearGradient(
                          //   colors: [
                          //     AppColors.gradient.g011,
                          //     AppColors.gradient.g032
                          //   ],
                          //   begin: Alignment.topLeft,
                          //   end: Alignment.bottomRight,
                          // ),
                          ),
                      child: const Center(child: Text("TF"))),
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
          Flexible(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Fedlis Nguyen has paid you ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 20)),
                        TextSpan(
                            text: '\$5.00',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     const  FittedBox(
                        fit: BoxFit.cover,
                        child: Text(
                            "event -> Life Coaching Introduction and Meeting"),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Flexible(
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: AppButton(
                                  title: "Confirm Payment",
                                  size: ButtonSize.small,
                                  gradient: true,
                                  icon: const FaIcon(
                                    FontAwesomeIcons.circleCheck,
                                    size: 16,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            const SizedBox().x4(),
                            Flexible(
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: AppButton(
                                  title: "Not Received",
                                  size: ButtonSize.small,
                                  textColor: Colors.white,
                                  color: AppColors.foundation.error,
                                  // icon: const Icon(
                                  //   Icons.cancel_rounded,
                                  //   size: 16,
                                  // ),
                                  onPressed: () {},
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const Text("email -> fnguyen@gmail.com"),
                  const Text("payment method -> CashApp"),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
