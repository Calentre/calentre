import 'package:calentre/config/extensions/padding.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/utils/icon_framer.dart';
import 'package:flutter/material.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 48, bottom: 48),
          constraints: const BoxConstraints(
            // minWidth: MediaQuery.sizeOf(context).width * .5,
            maxWidth: 1000,
          ),
          width: MediaQuery.sizeOf(context).width * .5,
          decoration: BoxDecoration(
            color: AppColors.grey.s900,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: AppColors.grey.s700,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconFramer(imageTitle: 'logo.svg'),
                    Text(
                      "Calentre",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                const SizedBox().h2(),
                const Text("Continue to Login/Signup"),
                const Text("Create an Account with Google"),
                const Text("Other Options coming soon"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
