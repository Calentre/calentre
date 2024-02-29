import 'package:calentre/config/theme/colors.dart';
import 'package:flutter/material.dart';

Color elementColorSelector(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };

  if (states.any(interactiveStates.contains)) {}
  if (states.any(interactiveStates.contains)) {
    return AppColors.grey.s300;
  }
  return AppColors.gradient.g012;
}
