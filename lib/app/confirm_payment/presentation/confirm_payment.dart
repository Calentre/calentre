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
    return BorderCard(
      verticalPadding: 12,
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
                  const CircleAvatar(
                    child: Text("TF"),
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
                      "The Coach Training Live session ",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("No Description"),
                        Row(
                          children: [
                            AppButton(
                              title: "Confirm Payment",
                              size: ButtonSize.small,
                              gradient: true,
                              icon: const FaIcon(
                                FontAwesomeIcons.circleCheck,
                                size: 16,
                              ),
                              onPressed: () {},
                            ),
                            const SizedBox().x4(),
                            AppButton(
                              title: "Not Received",
                              size: ButtonSize.small,
                              color: AppColors.foundation.error,
                              // icon: const Icon(
                              //   Icons.cancel_rounded,
                              //   size: 16,
                              // ),
                              onPressed: () {},
                            )
                          ],
                        )
                      ],
                    ),
                    const Text("Copy Link"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
