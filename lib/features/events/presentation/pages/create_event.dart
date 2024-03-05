import 'package:calentre/features/events/presentation/bloc/duration_drop_down_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/event_type_drop_down_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/multibooking_drop_down_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/platform_drop_down_bloc.dart';
import 'package:calentre/features/events/presentation/widgets/form_fields.dart';
import 'package:calentre/config/constraints/constraints.dart';
import 'package:calentre/config/extensions/spacing.dart';
import 'package:calentre/config/routes/routes.dart';
import 'package:calentre/config/theme/colors.dart';
import 'package:calentre/shared/widgets/button.dart';
import 'package:calentre/shared/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CreateEventView extends StatelessWidget {
  const CreateEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              context.goNamed(AppRoutes.calentreHome);
                            },
                            child: const FaIcon(
                                FontAwesomeIcons.circleChevronLeft)),
                        const SizedBox().x20(),
                        Text("Create Event",
                            style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    ),
                    AppButton(
                      title: "Create",
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
              Container(
                  width: 700,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: MultiBlocProvider(providers: [
                    BlocProvider<DurationDropDownBloc>(
                        create: (context) => DurationDropDownBloc()),
                    BlocProvider<PlatformDropDownBloc>(
                        create: (context) => PlatformDropDownBloc()),
                    BlocProvider<EventTypeDropDownBloc>(
                        create: (context) => EventTypeDropDownBloc()),
                    BlocProvider<MultiBookingDropDownBloc>(
                        create: (context) => MultiBookingDropDownBloc()),
                  ], child: const CreateEventFormFields()))
            ],
          ),
        ),
      ),
    );
  }
}
