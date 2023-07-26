import 'package:calentre/config/theme/colors.dart';
import 'package:flutter/material.dart';

ButtonStyle buttonStyle(BuildContext context, {Color? foregroundColor}) {
  return ButtonStyle(
    textStyle: MaterialStateProperty.resolveWith<TextStyle>(
      (states) => Theme.of(context).textTheme.bodySmall!,
    ),
    foregroundColor: MaterialStateProperty.resolveWith<Color>(
      (states) => AppColors.foundation.white,
    ),
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      //leave opacity at 0 (zero) so we can have pointer cursor on the web
      (states) => Colors.white.withOpacity(0),
    ),
    shadowColor: MaterialStateProperty.resolveWith<Color>(
      (states) => Colors.transparent,
    ),
    splashFactory: InkRipple.splashFactory,
    overlayColor: MaterialStateProperty.resolveWith<Color>(
      (states) => AppColors.foundation.white.withOpacity(.2),
    ),
    side: MaterialStateProperty.all(
      BorderSide(
        width: 2,
        color: AppColors.grey.s700,
      ),
    ),
  );
}
