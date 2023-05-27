import 'package:calentre/shared/border_card.dart';
import 'package:flutter/material.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BorderCard(
        child: Text(
          "Events View",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
