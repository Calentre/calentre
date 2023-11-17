import 'package:calentre/features/events/presentation/bloc/event/event_bloc.dart';
import 'package:calentre/features/history/presentation/history.dart';
import 'package:calentre/features/home/presentation/bloc/home_bloc.dart';
import 'package:calentre/features/home/presentation/bloc/home_state.dart';
import 'package:calentre/features/home/presentation/widgets/tab_bar.dart';
import 'package:calentre/features/events/presentation/events.dart';
import 'package:calentre/features/payments/presentation/payments.dart';
import 'package:calentre/injection_container.dart';
import 'package:calentre/shared/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalentreHome extends StatefulWidget {
  const CalentreHome({super.key});

  @override
  State<CalentreHome> createState() => _CalentreHomeState();
}

class _CalentreHomeState extends State<CalentreHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeViewBloc, HomeViewStates>(
            builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const NavBar(),
                tabBarViewSelector(state),
              ],
            ),
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    //close the CalentreEventBloc here
    sl.get<CalentreEventBloc>().close();
    super.dispose();
  }
}

tabBarViewSelector(state) {
  if (state is InitialState) {
    return Column(
      children: [
        const AppTabBar(
          currentIndex: 0,
        ),
        // EventsView(),
        BlocProvider<CalentreEventBloc>(
          create: (context) => sl.get<CalentreEventBloc>(),
          child: const EventsView(),
        )
      ],
    );
  } else if (state is UpdateState) {
    switch (state.viewIndex) {
      case 0:
        return Column(
          children: [
            const AppTabBar(
              currentIndex: 0,
            ),
            BlocProvider<CalentreEventBloc>(
              create: (context) => sl.get<CalentreEventBloc>(),
              child: const EventsView(),
            ),
          ],
        );

      case 1:
        return const Column(
          children: [
            AppTabBar(
              currentIndex: 1,
            ),
            HistoryView()
          ],
        );

      case 2:
        return const Column(
          children: [
            AppTabBar(
              currentIndex: 2,
            ),
            PaymentsView()
          ],
        );

      default:
    }
  }
}
