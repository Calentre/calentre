import 'package:calentre/app/events/presentation/bloc/set_availability_bloc.dart';
import 'package:calentre/app/events/presentation/bloc/time_drop_down_bloc.dart';
import 'package:calentre/app/events/presentation/widgets/scheduler.dart';
import 'package:calentre/config/constraints/constraints.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/routes/routes.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/button.dart';
import 'package:calentre/shared/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SetAvailabilityView extends StatelessWidget {
  SetAvailabilityView({super.key});

  final List<String> days = ["Tue", "Wed", "Thur", "Fri", "Sat", "Sun"];

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
          child: SizedBox(
            // constraints: BoxConstraints(maxWidth: WebConstraints.maxWidth),
            child: Column(
              children: [
                const NavBar(),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  width: WebConstraints.maxWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                context.pop();
                              },
                              child: const FaIcon(
                                  FontAwesomeIcons.circleChevronLeft)),
                          const SizedBox().x20(),
                          Text("Set Availability",
                              style: Theme.of(context).textTheme.headlineSmall),
                        ],
                      ),
                      AppButton(
                        title: "Publish Link",
                        onPressed: () {},
                        gradient: true,
                        width: 100,
                      )
                    ],
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.grey.s700,
                          width: 1.0,
                        ),
                      ),
                    )),
                const SizedBox().y20(),
                const SizedBox().y20(),
                Container(
                  width: 700,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child:
                            Text("Choose your Available time for this event"),
                      ),
                      const SizedBox().y20(),
                      AvailabilityScheduler(isFirstElement: true, day: "Mon"),
                      ...days.map((day) => Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: (8.0 + 8), bottom: 8),
                                child: Divider(
                                  thickness: .5,
                                  color: AppColors.grey.s500,
                                ),
                              ),
                              AvailabilityScheduler(
                                day: day,
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                const SizedBox().y20(),
                AppButton(
                  title: "Finish",
                  width: 600,
                  gradient: true,
                  onPressed: () {
                    context.goNamed(AppRoutes.completionFeedBack);
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.boltLightning,
                    color: Colors.amber,
                  ),
                )
              ],
            ),
          ),
        ),
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
