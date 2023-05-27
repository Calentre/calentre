import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/routes/routes.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/border_card.dart';
import 'package:calentre/shared/button.dart';
import 'package:calentre/utils/icon_framer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BorderCard(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        iconFramer(imageTitle: 'logo.svg'),
                        const SizedBox().x10(),
                        Text(
                          "Calentre",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                    const SizedBox().y20(),
                    Text(
                      "Continue to Login/Signup",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox().y20(),
                    const SizedBox().y20(),
                    AppButton(
                      title: "Login with Google",
                      icon: iconFramer(
                        imageTitle: 'google.png',
                      ),
                      onPressed: () {
                        context.goNamed(AppRoutes.calentreHome);
                      },
                    ),
                    const SizedBox().y10(),
                    AppButton(
                      title: "Other Options are coming soon",
                      icon: iconFramer(imageTitle: 'slack.png'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox().y20(),
            const SizedBox().y20(),
            Text(
              "By signing up, you agree to our Privacy Policy and Terms of Use.",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.grey.s500,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
