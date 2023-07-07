// import 'package:calentre/app/events/presentation/widgets/events_empty_state.dart';
import 'package:calentre/app/events/presentation/widgets/events_list.dart';
import 'package:flutter/material.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const EventsList();
    // return eventsEmptyState(context);
  }
}
