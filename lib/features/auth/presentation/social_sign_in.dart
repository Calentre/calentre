// import 'dart:js_util';

import 'package:animate_gradient/animate_gradient.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:calentre/features/auth/presentation/bloc/auth_events.dart';
import 'package:calentre/features/auth/presentation/bloc/auth_state.dart';
import 'package:calentre/injection_container.dart';
import 'package:calentre/shared/widgets/border_card.dart';
import 'package:calentre/shared/widgets/button.dart';
import 'package:calentre/utils/icon_framer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SocialSignIn extends StatelessWidget {
  SocialSignIn({super.key});
  final SupabaseClient supabase = Supabase.instance.client;
  final bloc = sl.get<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    //if signedIn, push HomeEvent screen
    return BlocProvider<AuthBloc>(
        create: (context) => bloc,
        child: BlocBuilder<AuthBloc, AuthUserState>(
          builder: (context, state) {
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
                                // title: "Sign IN",
                                icon: iconFramer(
                                  imageTitle: 'google.png',
                                ),
                                child: state is UserSignInLoading
                                    ? Align(
                                        child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              color: AppColors.foundation.white,
                                              strokeWidth: 1,
                                            )))
                                    : null,
                                onPressed: () async {
                                  context
                                      .read<AuthBloc>()
                                      .add(SignInWithGoogleEvent());
                                },
                              ),
                              const SizedBox().y10(),
                              AppButton(
                                title: "Other Options are coming soon",
                                icon: iconFramer(imageTitle: 'slack.png'),
                                onPressed: () async {
                                  GoRouter.of(context).go("/home");
                                  // await signOut();
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
          },
        ));
  }
}


// Future signOut() async {
//   await Supabase.instance.client.auth.signOut();
// }
