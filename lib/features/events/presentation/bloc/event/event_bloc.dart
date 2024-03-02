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

  // List<String> modifyTimeList(
  //     {required String day,
  //     required int index,
  //     required TimeSlotBoundary timeSlotBoundary}) {
  //   switch (day) {
  //     case "Mon":
  //       if (index == 0 && timeSlotBoundary == TimeSlotBoundary.start) {
  //         return TimeList().timeList;
  //       } else {
  //         if (timeSlotBoundary == TimeSlotBoundary.start) {
  //           final start = days.monday![index].start;
  //           print("Start time  is $start");
  //           final startTimeIndex = TimeList().timeList.indexOf(start!);
  //           final newTimeList = TimeList().timeList.sublist(startTimeIndex + 1);
  //           return newTimeList;
  //           // return TimeList().timeList;
  //         } else if (timeSlotBoundary == TimeSlotBoundary.end) {
  //           final start = days.monday![index].start;
  //           print("End time  is $start");

  //           final startTimeIndex = TimeList().timeList.indexOf(start!);
  //           print("End time index is $startTimeIndex");
  //           final newTimeList = TimeList().timeList.sublist(startTimeIndex);

  //           return newTimeList;
  //           // return TimeList().timeList;
  //         }
  //         return TimeList().timeList;
  //       }

  //       //get the index of the TimeSlot in CalTimeSlot

  //       //on select start time of the TimeSlot index
  //       //reduce the mondayTimelist
  //       //onSelect end Time
  //       //reduce the mondayTimeList
  //       break;
  //     // case "Tue":
  //     //   tuesdayTimeList.timeList;
  //     //   break;
  //     // case "Wed":
  //     //   wednesdayTimeList.timeList;
  //     //   break;
  //     // case "Thur":
  //     //   thursdayTimeList.timeList;
  //     //   break;
  //     // case "Fri":
  //     //   fridayTimeList.timeList;
  //     //   break;
  //     // case "Sat":
  //     //   saturdayTimeList.timeList;
  //     //   break;
  //     // case "Sun":
  //     //   sundayTimeList.timeList;
  //     //   break;
  //     default:
  //       return TimeList().timeList;
  //   }
  // }
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

//TODO: extract function to Util class
List getHourAndMeridiem(String time) {
  List<String> parts = time.split(' '); // Split the time string
  if (parts.length == 2) {
    String meridiem = parts[1].toUpperCase(); // Get the meridiem part
    if (meridiem == 'AM' || meridiem == 'PM') {
      List<String> timeParts = parts[0].split(':'); // Split hour and minute
      if (timeParts.length == 2) {
        int hour = int.tryParse(timeParts[0]) ?? 0; // Parse hour
        int minute = int.tryParse(timeParts[1]) ?? 0; // Parse minute
        if (hour >= 1 && hour <= 12 && minute >= 0 && minute <= 59) {
          return [
            hour,
            minute,
            meridiem
          ]; // Return formatted hour, minute, and meridiem
        }
      }
    }
  }
  return []; // Return an empty list if the format doesn't match
}
