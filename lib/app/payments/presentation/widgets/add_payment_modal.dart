import 'package:calentre/app/payments/presentation/widgets/payment_details_fields.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/border_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:overlay_dialog/overlay_dialog.dart';

Future<String?> addPaymentModal(BuildContext context) {
  Container paymentType({String? paymentType}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.grey.s850,
        child: InkWell(
          onTap: () async {
            Navigator.pop(context);
            addPaymentDetailsModal(context);
          },
          borderRadius: BorderRadius.circular(10),
          child: BorderCard(
              width: double.maxFinite,
              verticalPadding: 10,
              horizontalPadding: 12,
              color: AppColors.grey.s850.withOpacity(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const FaIcon(FontAwesomeIcons.building),
                      const SizedBox().x10(),
                      Text(paymentType ?? "Brank Transfer")
                    ],
                  ),
                  const FaIcon(FontAwesomeIcons.circleArrowRight),
                ],
              )),
        ),
      ),
    );
  }

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
              const Text("Add a New Payment"),
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
              paymentType(),
              paymentType(),
              paymentType(paymentType: "Others"),
            ],
          )),
    ),
  );
}

class AddPatmentModal extends StatelessWidget {
  const AddPatmentModal({super.key});

  @override
  Widget build(BuildContext context) {
    return DialogWidget.alert(title: "title", content: "content", actions: [
      DialogAction(
          title: "Fwd",
          handler: () {
            // context.go(location)
          })
    ]);
  }
}
