import 'package:calentre/features/events/presentation/bloc/set_availability_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/time_drop_down_bloc.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/routes/routes.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/button.dart';
import 'package:calentre/shared/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CompletionFeedBackView extends StatelessWidget {
  const CompletionFeedBackView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TimeDropDownBloc>(create: (context) => TimeDropDownBloc()),
        BlocProvider<SetAvailabilityBloc>(
            create: (context) => SetAvailabilityBloc()),
      ],
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            const NavBar(),
            Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: FormBorderCard(
                  // verticalPadding: 20,
                  width: 500,
                  child: Column(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.circleCheck,
                        size: 34,
                        color: AppColors.foundation.success,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 24.0),
                        child: Text(
                          "Invite Generated Successfully",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: FormBorderCard(
                  // verticalPadding: 20,
                  width: 500,
                  child: Column(
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.link,
                        size: 34,
                      ),
                      const SizedBox().y10(),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      decoration: TextDecoration.underline,
                                      color: AppColors.foundation.link),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 24.0),
                        child: Text(
                          "Copy and paste to share the link",
                        ),
                      )
                    ],
                  )),
            ),
            const SizedBox().y20(),
            AppButton(
              title: "Go Back to Home",
              onPressed: () {
                context.goNamed(AppRoutes.calentreHome);
              },
              gradient: false,
              width: 460,
            ),
          ],
        )),
      ),
    );
  }
}

class FormBorderCard extends StatelessWidget {
  const FormBorderCard(
      {super.key,
      required this.child,
      this.verticalPadding,
      this.width,
      this.leftPadding,
      this.rightPadding});

  final Widget child;
  final double? verticalPadding;
  final double? leftPadding;
  final double? rightPadding;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        padding: EdgeInsets.only(
            top: verticalPadding ?? 48,
            bottom: verticalPadding ?? 48,
            left: leftPadding ?? 0,
            right: rightPadding ?? 0),
        decoration: BoxDecoration(
          color: AppColors.grey.s900,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: AppColors.grey.s500,
            width: 1.0,
          ),
        ),
        child: child);
  }
}
