import 'package:calentre/app/home/presentation/widgets/tab_bar.dart';
import 'package:calentre/app/events/presentation/events.dart';
import 'package:calentre/shared/navbar.dart';
import 'package:flutter/material.dart';

class CalentreHome extends StatelessWidget {
  const CalentreHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            NavBar(),
            AppTabBar(),
            EventsView(),
          ],
        ),
      ),
    );
  }
}
