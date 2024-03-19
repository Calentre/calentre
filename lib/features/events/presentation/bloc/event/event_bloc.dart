import 'package:calentre/config/constants/time_list.dart';
import 'package:calentre/config/enums/weekdays.dart';
import 'package:calentre/features/events/data/models/calentre_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_event.dart';
import 'package:calentre/features/events/presentation/bloc/event/event_state.dart';
import 'package:calentre/features/events/presentation/helpers/validate_time_selection.dart';
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
    on<UpdateDayScheduleEvent>(onUpdateDaySchedule);
  }

  void onUpdateFormFields(UpdateCalentreEventDetailsEvent event,
      Emitter<CalentreEventBaseState> emit) {
    emit(state.clone(eventName: event.eventName, amount: event.amount));
  }

  void onUpdateDaySchedule(
      UpdateDayScheduleEvent event, Emitter<CalentreEventBaseState> emit) {
    final hasError = validateTimeSelection(
        day: event.day,
        startTime: event.startTime,
        endTime: event.endTime,
        index: event.index);
    if (hasError) {
      emit(DayScheduleErrorState(
          message: "Start Time must be less than End Time"));
    }
    final mondaySchedule = state.days.monday;
    final tuesdaySchedule = state.days.tuesday;
    final wednesdaySchedule = state.days.wednesday;
    final thursdaySchedule = state.days.thursday;
    final fridaySchedule = state.days.friday;
    final saturdaySchedule = state.days.saturday;
    final sundaySchedule = state.days.sunday;

    switch (event.day) {
      case WeekDays.monday:
        mondaySchedule!.insert(
            event.index, TimeSlot(start: event.startTime, end: event.endTime));
        break;
      case WeekDays.tuesday:
        tuesdaySchedule!.insert(
            event.index, TimeSlot(start: event.startTime, end: event.endTime));
        break;
      default:
    }
    // state.
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
