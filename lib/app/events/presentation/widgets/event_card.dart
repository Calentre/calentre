import 'package:calentre/shared/border_card.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const BorderCard(
      child: Text("This is the List of stateless"),
    );
  }
}
