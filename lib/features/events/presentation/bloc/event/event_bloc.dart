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
  String? start = TimeList().timeList.first;
  String? end = TimeList().timeList[1];

  CalTimeSlot({
    this.start,
    this.end,
  });
}
