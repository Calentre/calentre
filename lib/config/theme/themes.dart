import 'package:calentre/config/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme() {
    return ThemeData(
        colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: AppColors.grey.s900,
            onPrimary: AppColors.foundation.white,
            secondary: AppColors.grey.s850,
            onSecondary: AppColors.foundation.white,
            error: AppColors.foundation.error,
            onError: AppColors.foundation.white,
            background: AppColors.grey.s950,
            onBackground: AppColors.foundation.white,
            surface: AppColors.grey.s900,
            onSurface: AppColors.foundation.white));
  }
}
