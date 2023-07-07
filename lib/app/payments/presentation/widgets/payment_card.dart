import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/border_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class PaymentCard extends StatefulWidget {
  const PaymentCard({super.key});

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  bool switchValue = false;
  SampleItem? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BorderCard(
        verticalPadding: 24,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const FaIcon(FontAwesomeIcons.paypal),
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
                  SizedBox(
                    height: 25,
                    child: FittedBox(
                      child: Switch(
                        // This bool value toggles the switch.
                        value: switchValue,
                        // activeColor: Colors.blue,
                        trackOutlineColor: MaterialStateColor.resolveWith(
                            (c) => Colors.transparent),
                        inactiveTrackColor: AppColors.grey.s700,
                        activeTrackColor:
                            AppColors.foundation.success.withOpacity(.3),
                        thumbColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return AppColors.foundation.success;
                          } else {
                            return AppColors.grey.s300;
                          }
                        }),

                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                          setState(() {
                            switchValue = !switchValue;
                            print("Changed $value");
                          });
                        },
                      ),
                    ),
                  ),
                  PopupMenuButton<SampleItem>(
                    initialValue: selectedMenu,
                    // Callback that sets the selected popup menu item.
                    onSelected: (SampleItem item) {
                      setState(() {
                        selectedMenu = item;
                      });
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<SampleItem>>[
                      const PopupMenuItem<SampleItem>(
                        value: SampleItem.itemOne,
                        child: Text('Item 1'),
                      ),
                      const PopupMenuItem<SampleItem>(
                        value: SampleItem.itemTwo,
                        child: Text('Item 2'),
                      ),
                      const PopupMenuItem<SampleItem>(
                        value: SampleItem.itemThree,
                        child: Text('Item 3'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
