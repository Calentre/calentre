import 'package:calentre/config/theme/colors.dart';
import 'package:flutter/material.dart';

ColorScheme colorScheme() {
  return ColorScheme(
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
      onSurface: AppColors.foundation.white);
}
