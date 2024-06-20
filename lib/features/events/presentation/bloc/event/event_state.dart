// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:calentre/config/constants/time_list.dart';
import 'package:calentre/config/enums/weekdays.dart';
import 'package:calentre/features/events/data/models/calentre_event.dart';
import 'package:equatable/equatable.dart';

///We are using a single state to control the entire CalentreEvent feature.

enum LoadingStatus {
  idle, //to initialize the loading state
  createEventIdle,
  createEventLoading,
  createEventDone,
  createEventError,
  getEventIdle,
  getEventLoading,
  getEventDone,
  getEventError,
}

class CalentreEventBaseState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CalentreEventState extends CalentreEventBaseState {
  final String amount;
  final String duration;
  final String eventDescription;
  final String eventLink;
  final String eventName;
  final String eventType;
  final String isMultiple;
  final String platformType;
  final Days days;
  final LoadingStatus loadingStatus;

  CalentreEventState(
      {required this.eventName,
      required this.eventType,
      required this.isMultiple,
      required this.platformType,
      required this.days,
      required this.amount,
      required this.duration,
      required this.eventDescription,
      required this.eventLink,
      required this.loadingStatus});

  //initial method
  static CalentreEventState initial() {
    return CalentreEventState(
        amount: "",
        duration: "",
        eventDescription: "",
        eventLink: "",
        eventName: "",
        eventType: "",
        isMultiple: "",
        platformType: "",
        loadingStatus: LoadingStatus.idle,
        days: Days(
          monday: [
            TimeSlot(
                start: TimeList().timeList.first, end: TimeList().timeList[1])
          ],
          tuesday: [
            TimeSlot(
                start: TimeList().timeList.first, end: TimeList().timeList[1])
          ],
          wednesday: [
            TimeSlot(
                start: TimeList().timeList.first, end: TimeList().timeList[1])
          ],
          thursday: [
            TimeSlot(
                start: TimeList().timeList.first, end: TimeList().timeList[1])
          ],
          friday: [
            TimeSlot(
                start: TimeList().timeList.first, end: TimeList().timeList[1])
          ],
          saturday: [
            TimeSlot(
                start: TimeList().timeList.first, end: TimeList().timeList[1])
          ],
          sunday: [
            TimeSlot(
                start: TimeList().timeList.first, end: TimeList().timeList[1])
          ],
        ));
  }

  ///Returns a new instance(state) of the [CalentreEventState]
  CalentreEventState clone(CalentreEventState state,
      {String? amount,
      String? duration,
      String? eventDescription,
      String? eventLink,
      String? eventName,
      String? eventType,
      String? isMultiple,
      String? platformType,
      LoadingStatus? loadingStatus,
      Days? days}) {
    // print("when cloning, state is ${state.days}");
    return CalentreEventState(
      eventName: eventName ?? state.eventName,
      eventType: eventType ?? state.eventType,
      isMultiple: isMultiple ?? state.isMultiple,
      platformType: platformType ?? state.platformType,
      days: days ?? state.days,
      amount: amount ?? state.amount,
      duration: duration ?? state.duration,
      eventDescription: eventDescription ?? state.eventDescription,
      eventLink: eventLink ?? state.eventLink,
      loadingStatus: loadingStatus ?? state.loadingStatus,
    );
  }

  @override
  List<Object?> get props => [
        amount,
        duration,
        eventDescription,
        eventLink,
        eventName,
        isMultiple,
        platformType,
        days
      ];
}

class DayScheduleValidationState extends CalentreEventBaseState {
  final String message;
  final int index;
  final WeekDays day;
  final List<Map<WeekDays, List<bool>>>
      errorList; //Stores the error value based on time-dropdown index

  DayScheduleValidationState(
      {required this.message,
      required this.index,
      required this.day,
      required this.errorList});

  static DayScheduleValidationState initial() {
    return DayScheduleValidationState(
        message: "",
        index: 0,
        day: WeekDays.monday,
        errorList: [
          {
            WeekDays.monday: [false]
          },
          {
            WeekDays.tuesday: [false]
          },
          {
            WeekDays.wednesday: [false]
          },
          {
            WeekDays.thursday: [false]
          },
          {
            WeekDays.friday: [false]
          },
          {
            WeekDays.saturday: [false]
          },
          {
            WeekDays.sunday: [false]
          },
        ]);
  }

  DayScheduleValidationState clone(DayScheduleValidationState state,
      {String? message,
      int? index,
      WeekDays? day,
      List<Map<WeekDays, List<bool>>>? errorList}) {
    return DayScheduleValidationState(
        message: message ?? state.message,
        index: index ?? state.index,
        day: day ?? state.day,
        errorList: errorList ?? state.errorList);
  }

  @override
  List<Object> get props => [index, day, message, errorList];
}
