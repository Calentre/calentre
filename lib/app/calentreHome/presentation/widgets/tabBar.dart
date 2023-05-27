import 'package:calentre/config/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.grey.s700,
            width: 1.0,
          ),
        ),
      ),
      child: Center(
        child: Text("Custom TabBar"),
      ),
    );
  }
}
