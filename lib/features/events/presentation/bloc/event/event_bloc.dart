import 'package:calentre/config/constants/time_list.dart';
import 'package:calentre/config/enums/time_slots.dart';
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
  CalDays days = CalDays(
    monday: [
      CalTimeSlot(start: TimeList().timeList.first, end: TimeList().timeList[1])
    ],
    tuesday: [CalTimeSlot()],
    wednesday: [CalTimeSlot()],
    thursday: [CalTimeSlot()],
    friday: [CalTimeSlot()],
    saturday: [CalTimeSlot()],
    sunday: [CalTimeSlot()],
  );

  CalentreEventBloc() : super(CalentreEventInitialState()) {
    on<ProceedToSetAvailabilityEvent>(onClickDropDownItem);
  }

  void onClickDropDownItem(
      ProceedToSetAvailabilityEvent event, Emitter<CalentreEventState> emit) {
    //infuse all the class variables into CalentreEvent to create an update state
    emit(CalentreEventUpdatedState(calentreEvent: CalentreEvent()));
  }

  validateTimeDropDown({required String day, required int index}) {
    switch (day) {
      case "Mon":
        //if start time is greater than end time, return error
        String startTime = days.monday![index].start!;
        String endTime = days.monday![index].end!;

        int startTimeHour = getHourAndMeridiem(startTime)[0] == 12
            ? 0
            : getHourAndMeridiem(startTime)[0];
        int startTimeMinute = getHourAndMeridiem(startTime)[1];
        String startTimeMeridiem = getHourAndMeridiem(startTime)[2];

        int endTimeHour = getHourAndMeridiem(endTime)[0] == 12
            ? 0
            : getHourAndMeridiem(endTime)[0];
        ;
        int endTimeMinute = getHourAndMeridiem(endTime)[1];
        String endTimeMeridiem = getHourAndMeridiem(endTime)[2];

        if (startTimeMeridiem == "AM" && endTimeMeridiem == "PM") {
          //success
          isTimeError = false;
          print("An error" +
              "$endTimeHour" +
              "$endTimeMinute" +
              "$endTimeMeridiem");
        } else if (startTimeMeridiem == "PM" && endTimeMeridiem == "AM") {
          isTimeError = true;
        } else if (startTimeMeridiem == "AM" && endTimeMeridiem == "AM") {
          if (startTimeHour < endTimeHour) {
            isTimeError = false;
          } else if (startTimeHour > endTimeHour) {
            isTimeError = true;
          } else {
            if (startTimeMinute < endTimeMinute) {
              isTimeError = false;
            } else {
              isTimeError = true;
            }
          }
        } else if (startTimeMeridiem == "PM" && endTimeMeridiem == "PM") {
          if (startTimeHour < endTimeHour) {
            isTimeError = false;
          } else if (startTimeHour > endTimeHour) {
            isTimeError = true;
          } else {
            if (startTimeMinute < endTimeMinute) {
              isTimeError = false;
            } else {
              isTimeError = true;
            }
          }
        }

        //check the greater of the meridiem
        //check the greater of the numbers

        //4:05 PM - 2:50 PM
        //if start meridiem is AM and end is PM
        //success
        //if start is AM and end is AM
        //check if end time > than start
        //success
        //else failure
        //else if start is PM and end is AM
        //return error
        //else if PM and PM
        //check if end time > than startTime
        //success
        //else
        //error

        break;
      // case "Tue":
      //   tuesdayTimeList.timeList;
      //   break;
      // case "Wed":
      //   wednesdayTimeList.timeList;
      //   break;
      // case "Thur":
      //   thursdayTimeList.timeList;
      //   break;
      // case "Fri":
      //   fridayTimeList.timeList;
      //   break;
      // case "Sat":
      //   saturdayTimeList.timeList;
      //   break;
      // case "Sun":
      //   sundayTimeList.timeList;
      //   break;
      default:
        return "Start Time must be before end time ";
    }
  }

  List<String> modifyTimeList(
      {required String day,
      required int index,
      required TimeSlotBoundary timeSlotBoundary}) {
    switch (day) {
      case "Mon":
        if (index == 0 && timeSlotBoundary == TimeSlotBoundary.start) {
          return TimeList().timeList;
        } else {
          if (timeSlotBoundary == TimeSlotBoundary.start) {
            final start = days.monday![index].start;
            print("Start time  is $start");
            final startTimeIndex = TimeList().timeList.indexOf(start!);
            final newTimeList = TimeList().timeList.sublist(startTimeIndex + 1);
            return newTimeList;
            // return TimeList().timeList;
          } else if (timeSlotBoundary == TimeSlotBoundary.end) {
            final start = days.monday![index].start;
            print("End time  is $start");

            final startTimeIndex = TimeList().timeList.indexOf(start!);
            print("End time index is $startTimeIndex");
            final newTimeList = TimeList().timeList.sublist(startTimeIndex);

            return newTimeList;
            // return TimeList().timeList;
          }
          return TimeList().timeList;
        }

        //get the index of the TimeSlot in CalTimeSlot

        //on select start time of the TimeSlot index
        //reduce the mondayTimelist
        //onSelect end Time
        //reduce the mondayTimeList
        break;
      // case "Tue":
      //   tuesdayTimeList.timeList;
      //   break;
      // case "Wed":
      //   wednesdayTimeList.timeList;
      //   break;
      // case "Thur":
      //   thursdayTimeList.timeList;
      //   break;
      // case "Fri":
      //   fridayTimeList.timeList;
      //   break;
      // case "Sat":
      //   saturdayTimeList.timeList;
      //   break;
      // case "Sun":
      //   sundayTimeList.timeList;
      //   break;
      default:
        return TimeList().timeList;
    }
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
