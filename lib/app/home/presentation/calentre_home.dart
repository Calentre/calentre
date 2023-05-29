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
            const AppTabBar(),
            Container(child: tabBarViewSelector(state))
          ],
        );
      })),
    );
  }
}

tabBarViewSelector(state) {
  if (state is InitialState) {
    return const EventsView();
  } else if (state is UpdateState) {
    switch (state.viewIndex) {
      case 0:
        const EventsView();
        break;

      case 1:
        const HistoryView();
        break;
      case 2:
        const PaymentsView();
        break;

      default:
    }
  }
}
