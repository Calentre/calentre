import 'package:calentre/config/theme/colors.dart';
import 'package:flutter/material.dart';

class BorderCard extends StatelessWidget {
  const BorderCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 48, bottom: 48),
        constraints: const BoxConstraints(
          // minWidth: MediaQuery.sizeOf(context).width * .5,
          maxWidth: 1000,
        ),
        width: MediaQuery.sizeOf(context).width * .5,
        decoration: BoxDecoration(
          color: AppColors.grey.s900,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: AppColors.grey.s700,
            width: 1.0,
          ),
        ),
        child: child);
  }
}
