import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/utils/icon_framer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: AppColors.grey.s850,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: SizedBox(
          width: 1024,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconFramer(imageTitle: 'logo.svg'),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      debugPrint("Copied!");
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.copy,
                      size: 20,
                    ),
                  ),
                  const SizedBox().x10(),
                  InkWell(
                    onTap: () {
                      debugPrint("Linked visited");
                    },
                    child: Text(
                      "Calentre.com/tonkevic",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          decoration: TextDecoration.underline,
                          color: AppColors.foundation.link),
                    ),
                  ),
                ],
              ),
              const CircleAvatar(
                child: Text("LY"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
