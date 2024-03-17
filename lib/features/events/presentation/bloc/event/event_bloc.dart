import 'package:calentre/config/constants/time_list.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalentreEventBloc extends Bloc<CalentreEventEvent, CalentreEventState> {
  bool isTimeError = false;
  List<Map<String, List<bool>>> errorList = [
    {
      "Mon": [false]
    },
    {
      "Tue": [false]
    },
    {
      "Wed": [false]
    },
    {
      "Thur": [false]
    },
    {
      "Fri": [false]
    },
    {
      "Sat": [false]
    },
    {
      "Sun": [false]
    },
  ];

  //Helps the setAvailabilty bloc rebuild
  int rebuildCounter = 0;

  //TODO: rename variable. The current timeIndex that currently clicked on the availability schedule. Used here because of the SingleTon reg. of the current bloc
  int currentIndex = 0;
  String? currentDay;

  CalDays days = CalDays(
    monday: [
      CalTimeSlot(start: TimeList().timeList.first, end: TimeList().timeList[1])
    ],
    tuesday: [
      CalTimeSlot(start: TimeList().timeList.first, end: TimeList().timeList[1])
    ],
    wednesday: [
      CalTimeSlot(start: TimeList().timeList.first, end: TimeList().timeList[1])
    ],
    thursday: [
      CalTimeSlot(start: TimeList().timeList.first, end: TimeList().timeList[1])
    ],
    friday: [
      CalTimeSlot(start: TimeList().timeList.first, end: TimeList().timeList[1])
    ],
    saturday: [
      CalTimeSlot(start: TimeList().timeList.first, end: TimeList().timeList[1])
    ],
    sunday: [
      CalTimeSlot(start: TimeList().timeList.first, end: TimeList().timeList[1])
    ],
  );

  CalentreEventBloc() : super(CalentreEventState.initial()) {
    on<UpdateCalentreEventDetailsEvent>(onUpdateFormFields);
  }

  void onUpdateFormFields(
      UpdateCalentreEventDetailsEvent event, Emitter<CalentreEventState> emit) {
    // final eventName = event.eventName;
    final amount = event.amount;
    emit(state.clone(eventName: event.eventName, amount: amount));
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
  String? start = TimeList().timeList.first;
  String? end = TimeList().timeList[1];

  CalTimeSlot({
    this.start,
    this.end,
  });
}
