import 'package:calentre/config/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme() {
    return ThemeData(
        scaffoldBackgroundColor: AppColors.grey.s950,
        colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: AppColors.grey.s950,
            onPrimary: AppColors.foundation.white,
            secondary: AppColors.grey.s950,
            onSecondary: AppColors.foundation.white,
            error: AppColors.foundation.error,
            onError: AppColors.foundation.white,
            background: AppColors.grey.s950,
            onBackground: AppColors.foundation.white,
            surface: AppColors.grey.s900,
            onSurface: AppColors.foundation.white));
  }
}
