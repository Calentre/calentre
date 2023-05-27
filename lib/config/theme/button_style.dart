import 'package:calentre/config/theme/colors.dart';
import 'package:flutter/material.dart';

ButtonStyle buttonStyle(BuildContext context) {
  return ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith<TextStyle>(
        (states) => Theme.of(context).textTheme.bodySmall!,
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (states) => AppColors.foundation.white,
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (states) => Colors.transparent,
      ),
      shadowColor: MaterialStateProperty.resolveWith<Color>(
        (states) => Colors.transparent,
      ),
      splashFactory: InkRipple.splashFactory,
      overlayColor: MaterialStateProperty.resolveWith<Color>(
        (states) => AppColors.grey.s900,
      ),
      side: MaterialStateProperty.all(
        BorderSide(
          width: 2,
          color: AppColors.grey.s700,
        ),
      ));
}
