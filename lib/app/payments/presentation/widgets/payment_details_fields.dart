import 'package:calentre/app/create_events/presentation/widget/event_type_drop_down.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Future<String?> addPaymentDetailsModal(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      backgroundColor: AppColors.grey.s900,
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: AppColors.grey.s700, width: 1)),
      content: Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const FaIcon(FontAwesomeIcons.circleChevronLeft),
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
                  // const EventTypeDropDown()
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
    ),
  );
}
