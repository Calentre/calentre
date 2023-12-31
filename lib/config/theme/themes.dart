import 'package:calentre/config/theme/color_scheme.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/config/theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.grey.s950,
      textTheme: textTheme(),
      colorScheme: colorScheme(),
      buttonTheme: const ButtonThemeData(minWidth: 1000),
      dialogTheme: DialogTheme(
        backgroundColor: AppColors.grey.s900,
        shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: AppColors.grey.s700, width: 1)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusColor: AppColors.grey.s700,
        fillColor: AppColors.grey.s900,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey.s500,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.gradient.g011,
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey.s500,
            width: 1,
          ),
        ),
      ),
    );
  }
}
