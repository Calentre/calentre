import 'package:calentre/config/constants/time_list.dart';
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
    monday: [
      CalTimeSlot(
          start: mondayTimeList.timeList.first,
          end: mondayTimeList.timeList.last)
    ],
    tuesday: [
      CalTimeSlot(
          start: tuesdayTimeList.timeList.first,
          end: tuesdayTimeList.timeList.last)
    ],
    wednesday: [
      CalTimeSlot(
          start: wednesdayTimeList.timeList.first,
          end: wednesdayTimeList.timeList.last)
    ],
    thursday: [
      CalTimeSlot(
          start: thursdayTimeList.timeList.first,
          end: thursdayTimeList.timeList.last)
    ],
    friday: [
      CalTimeSlot(
          start: fridayTimeList.timeList.first,
          end: fridayTimeList.timeList.last)
    ],
    saturday: [
      CalTimeSlot(
          start: saturdayTimeList.timeList.first,
          end: saturdayTimeList.timeList.last)
    ],
    sunday: [
      CalTimeSlot(
          start: sundayTimeList.timeList.first,
          end: sundayTimeList.timeList.last)
    ],
  );

  CalentreEventBloc() : super(CalentreEventInitialState()) {
    on<ProceedToSetAvailabilityEvent>(onClickDropDownItem);
  }

  void onClickDropDownItem(
      ProceedToSetAvailabilityEvent event, Emitter<CalentreEventState> emit) {
    //infuse all the class variables into CalentreEvent to create an update state
    emit(CalentreEventUpdatedState(calentreEvent: CalentreEvent()));
  }

  void modifyTimeList() {}
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
