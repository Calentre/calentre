import 'package:calentre/config/constraints/constraints.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:flutter/material.dart';

class BorderCard extends StatelessWidget {
  const BorderCard({super.key, required this.child, this.verticalPadding});

  final Widget child;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: verticalPadding ?? 48, bottom: verticalPadding ?? 48),
        constraints: BoxConstraints(
          minWidth: MediaQuery.sizeOf(context).width * .5,
          maxWidth: WebConstraints.maxWidth,
        ),
        width: MediaQuery.sizeOf(context).width,
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
