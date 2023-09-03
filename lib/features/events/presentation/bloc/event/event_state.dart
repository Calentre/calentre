import 'package:calentre/features/events/data/models/calentre_event.dart';
import 'package:equatable/equatable.dart';

class CalentreEventState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CalentreEventInitialState extends CalentreEventState {
  final CalentreEvent calentreEvent = const CalentreEvent();
  @override
  List<Object?> get props => [calentreEvent];
}

class CalentreEventUpdatedState extends CalentreEventState {
  CalentreEventUpdatedState({required this.calentreEvent});
  final CalentreEvent calentreEvent;

  @override
  List<Object?> get props => [calentreEvent];
}
