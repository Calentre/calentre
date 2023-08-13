import 'package:animate_gradient/animate_gradient.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/routes/routes.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/border_card.dart';
import 'package:calentre/shared/button.dart';
import 'package:calentre/utils/icon_framer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimateGradient(
        duration: const Duration(seconds: 5),
        primaryBegin: Alignment.topLeft,
        primaryEnd: Alignment.bottomLeft,
        secondaryBegin: Alignment.bottomLeft,
        secondaryEnd: Alignment.topRight,
        primaryColors: [
          AppColors.grey.s950,
          AppColors.gradient.g031.withOpacity(.2),
          AppColors.grey.s950,
        ],
        secondaryColors: [
          AppColors.grey.s950,
          AppColors.gradient.g022.withOpacity(.2),
          AppColors.grey.s950,
        ],
        child: Center(
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
                        onPressed: () async {
                          // await signInWithGoogle(context);
                          // context.goNamed(AppRoutes.calentreHome);
                        },
                      ),
                      const SizedBox().y10(),
                      AppButton(
                        title: "Other Options are coming soon",
                        icon: iconFramer(imageTitle: 'slack.png'),
                        onPressed: () async {
                          await signOut();
                        },
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
      ),
    );
  }
}

Future signInWithGoogle(context) async {
  // Create a new provider
  // GoogleAuthProvider googleProvider = GoogleAuthProvider();

  // googleProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
  // googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

  // // Once signed in, return the UserCredential
  // final res = await FirebaseAuth.instance.signInWithPopup(googleProvider);

  // return res;
  // Or use signInWithRedirect
  // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);

  final res = await Supabase.instance.client.auth.signInWithOAuth(
      Provider.google,
      context: context,
      authScreenLaunchMode: LaunchMode.externalNonBrowserApplication,
      redirectTo: "https://pwvyfxvyfbosajpvytpt.supabase.co/auth/v1/callback");

  // final res = await Supabase.instance.client.auth.signUp(
  //   email: "testing2@gmail.com",
  //   password: '',
  // );

  print("The google signin result is ${res}");
  print("The current user is ${Supabase.instance.client.auth.currentUser}");
}

Future signOut() async {
  print("The current user is ${Supabase.instance.client.auth.currentUser}");

  // final res = await Supabase.instance.client.auth.signOut();
  print("This user signed out ");
}
