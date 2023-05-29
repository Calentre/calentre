import 'package:calentre/app/home/presentation/bloc/home_bloc.dart';
import 'package:calentre/app/home/presentation/bloc/home_state.dart';
import 'package:calentre/app/home/presentation/widgets/tab_bar.dart';
import 'package:calentre/app/events/presentation/events.dart';
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
            Container(child: tabBarView(state))
          ],
        );
      })),
    );
  }
}

tabBarView(state) {
  if (state is InitialState) {
    return const EventsView();
  } else if (state is UpdateState) {
    switch (state.viewIndex) {
      case 0:
        EventsView();
        break;

      case 1:
        EventsView();
        break;
      default:
    }
  }
}
