import 'package:calentre/app/set_availability/presentation/bloc/time_drop_down_bloc.dart';
import 'package:calentre/app/set_availability/presentation/widgets/time_drop_down.dart';
import 'package:calentre/config/constraints/constraints.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/button.dart';
import 'package:calentre/shared/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SetAvailabilityView extends StatelessWidget {
  const SetAvailabilityView({super.key});

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TimeDropDownBloc>(create: (context) => TimeDropDownBloc()),
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
                  height: 700,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child:
                            Text("Choose your Available time for this event"),
                      ),
                      const SizedBox().y20(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text("Day"),
                                ),
                                FormBorderCard(
                                  verticalPadding: 11.5,
                                  leftPadding: 12,
                                  width: double.maxFinite,
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        checkColor: Colors.white,
                                        fillColor:
                                            MaterialStateProperty.resolveWith(
                                                getColor),
                                        value: true,
                                        onChanged: (bool? value) {
                                          // setState(() {
                                          //   isChecked = value!;
                                          // });
                                        },
                                      ),
                                      const Text("Mon"),
                                      const SizedBox().x10(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox().x14(),
                          const Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Text("Start"),
                              ),
                              TimeDropDown()
                            ],
                          )),
                          const SizedBox().x14(),
                          const Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Text("End"),
                              ),
                              TimeDropDown()
                            ],
                          )),
                          const SizedBox().x14(),
                          const Padding(
                            padding: EdgeInsets.only(top: 18),
                            child: FaIcon(FontAwesomeIcons.solidSquarePlus),
                          ),
                          const SizedBox().x14(),
                          const Padding(
                            padding: EdgeInsets.only(top: 18),
                            child: FaIcon(FontAwesomeIcons.trash),
                          ),
                        ],
                      ),
                    ],
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
