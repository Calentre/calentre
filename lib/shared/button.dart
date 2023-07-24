import 'package:calentre/config/enums/button_size.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/theme/button_style.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.title,
      this.icon,
      required this.onPressed,
      this.gradient,
      this.width,
      this.size,
      this.color,
      this.textColor});

  final String title;
  final Widget? icon;
  final double? width;
  final bool? gradient;
  final ButtonSize? size;
  final Color? color;
  final Color? textColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000.0),
        color: (gradient ?? false) ? null : color ?? AppColors.grey.s850,
        gradient: (gradient ?? false)
            ? LinearGradient(
                colors: [AppColors.gradient.g011, AppColors.gradient.g012],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
      ),
      child: ElevatedButton(
        style: buttonStyle(context, foregroundColor: textColor),
        onPressed: onPressed,
        child: SizedBox(
          height: size == ButtonSize.small ? 25 : 50,
          width: width,
          child: Align(
            alignment: Alignment.center,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: icon,
                ),
                icon != null ? const SizedBox().x10() : const SizedBox(),
                FittedBox(
                  fit: BoxFit.none,
                  child: Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: textColor ?? AppColors.foundation.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
