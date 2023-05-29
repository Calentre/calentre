import 'package:calentre/app/history/presentation/history.dart';
import 'package:calentre/app/home/presentation/bloc/home_bloc.dart';
import 'package:calentre/app/home/presentation/bloc/home_state.dart';
import 'package:calentre/app/home/presentation/widgets/tab_bar.dart';
import 'package:calentre/app/events/presentation/events.dart';
import 'package:calentre/app/payments/presentation/payments.dart';
import 'package:calentre/shared/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalentreHome extends StatelessWidget {
  const CalentreHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
          BlocBuilder<HomeViewBloc, HomeViewStates>(builder: (context, state) {
        return Column(
          children: [
            const NavBar(),
            tabBarViewSelector(state),
          ],
        );
      })),
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
        EventsView(),
      ],
    );
  } else if (state is UpdateState) {
    switch (state.viewIndex) {
      case 0:
        const Column(
          children: [
            AppTabBar(
              currentIndex: 0,
            ),
            EventsView(),
          ],
        );
        break;

      case 1:
        const Column(
          children: [
            AppTabBar(
              currentIndex: 2,
            ),
            HistoryView()
          ],
        );

        break;
      case 2:
        const Column(
          children: [
            AppTabBar(
              currentIndex: 2,
            ),
            PaymentsView()
          ],
        );
        break;

      default:
    }
  }
}
