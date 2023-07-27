import 'package:calentre/features/history/presentation/history.dart';
import 'package:calentre/features/home/presentation/bloc/home_bloc.dart';
import 'package:calentre/features/home/presentation/bloc/home_state.dart';
import 'package:calentre/features/home/presentation/widgets/tab_bar.dart';
import 'package:calentre/features/events/presentation/events.dart';
import 'package:calentre/features/payments/presentation/payments.dart';
import 'package:calentre/shared/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalentreHome extends StatelessWidget {
  const CalentreHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocBuilder<HomeViewBloc, HomeViewStates>(builder: (context, state) {
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
    );
  }
}

tabBarViewSelector(state) {
  if (state is InitialState) {
    return const Column(
      children: [
        AppTabBar(
          currentIndex: 0,
        ),
        // EventsView(),
        PaymentsView()
      ],
    );
  } else if (state is UpdateState) {
    switch (state.viewIndex) {
      case 0:
        return const Column(
          children: [
            AppTabBar(
              currentIndex: 0,
            ),
            EventsView(),
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
