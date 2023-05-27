import 'package:calentre/app/events/presentation/events.dart';
import 'package:flutter/material.dart';

class CalentreHome extends StatelessWidget {
  const CalentreHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: EventsView(),
      ),
    );
  }
}
