import 'package:calentre/features/events/data/models/calentre_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalentreEventBloc extends Bloc<CalentreEventEvent, CalentreEventState> {
  String? eventName;
  String? eventDescription;
  String? platform;
  String? duration;
  String? eventLink;
  String? eventType;
  String? amount;
  String? isMultiple;
  CalDays days = CalDays(
    monday: [CalTimeSlot(start: "12:00 AM", end: "11:50 PM")],
    tuesday: [CalTimeSlot(start: "12:00 AM", end: "11:50 PM")],
    wednesday: [CalTimeSlot(start: "12:00 AM", end: "11:50 PM")],
    thursday: [CalTimeSlot(start: "12:00 AM", end: "11:50 PM")],
    friday: [CalTimeSlot(start: "12:00 AM", end: "11:50 PM")],
    saturday: [CalTimeSlot(start: "12:00 AM", end: "11:50 PM")],
    sunday: [CalTimeSlot(start: "12:00 AM", end: "11:50 PM")],
  );

  CalentreEventBloc() : super(CalentreEventInitialState()) {
    on<ProceedToSetAvailabilityEvent>(onClickDropDownItem);
  }

  void onClickDropDownItem(
      ProceedToSetAvailabilityEvent event, Emitter<CalentreEventState> emit) {
    //infuse all the class variables into CalentreEvent to create an update state
    emit(CalentreEventUpdatedState(calentreEvent: CalentreEvent()));
  }
}

class CalDays {
  List<CalTimeSlot>? monday;
  List<CalTimeSlot>? tuesday;
  List<CalTimeSlot>? wednesday;
  List<CalTimeSlot>? thursday;
  List<CalTimeSlot>? friday;
  List<CalTimeSlot>? saturday;
  List<CalTimeSlot>? sunday;

  CalDays({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });
}

class CalTimeSlot {
  String? start;
  String? end;

  CalTimeSlot({
    this.start,
    this.end,
  });
}
