import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/border_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum MenuItems { details, delete }

class PaymentCard extends StatefulWidget {
  const PaymentCard({super.key});

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  bool switchValue = false;
  MenuItems? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BorderCard(
        verticalPadding: 12,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10000.0),
                          color: AppColors.foundation.white),
                      child: const Center(
                          child: FaIcon(
                        FontAwesomeIcons.paypal,
                        color: Colors.pink,
                      ))),
                  const SizedBox().x10(),
                  Text(
                    "PayPal",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox().x10(),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  switchValue
                      ? Text(
                          "Active",
                          style: TextStyle(color: AppColors.foundation.success),
                        )
                      : Text("Inactive",
                          style: TextStyle(color: AppColors.grey.s300)),
                  const SizedBox().x10(),
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
                          });
                        },
                      ),
                    ),
                  ),
                  PopupMenuButton<MenuItems>(
                    initialValue: selectedMenu,
                    // Callback that sets the selected popup menu item.
                    onSelected: (MenuItems item) {
                      setState(() {
                        selectedMenu = item;
                      });
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<MenuItems>>[
                      PopupMenuItem<MenuItems>(
                        value: MenuItems.details,
                        child: Text(
                          'View',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      PopupMenuItem<MenuItems>(
                        value: MenuItems.delete,
                        child: Text('Remove Payment, ',
                            style: Theme.of(context).textTheme.bodyMedium),
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
