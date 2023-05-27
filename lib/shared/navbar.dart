import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/utils/icon_framer.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey.s900,
      child: SizedBox(
        width: 1024,
        child: Row(
          children: [
            iconFramer(imageTitle: 'logo.svg'),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Your Link -"),
                Text("Copy Icon -"),
                Text("Your Link -"),
              ],
            ),
            const CircleAvatar(
              child: Text("LY"),
            )
          ],
        ),
      ),
    );
  }
}
