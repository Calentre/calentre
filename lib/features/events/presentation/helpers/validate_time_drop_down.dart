import 'package:calentre/features/events/presentation/bloc/event/event_bloc.dart';
import 'package:calentre/utils/get_time_from_meridiem.dart';

//TODO:Remove this validate function
validateTimeDropDownHelper(
    {required String day,
    required int index,
    required CalentreEventBloc calentreEventBloc}) {
  //Trigger a rebuild
  calentreEventBloc.rebuildCounter++;

  switch (day) {
    case "Mon":
      //if start time is greater than end time, return error
      calentreEventBloc.currentDay = "Mon";
      String startTime = calentreEventBloc.days.monday![index].start!;
      String endTime = calentreEventBloc.days.monday![index].end!;

      int startTimeHour = getHourAndMeridiem(startTime)[0] == 12
          ? 0
          : getHourAndMeridiem(startTime)[0];
      int startTimeMinute = getHourAndMeridiem(startTime)[1];
      String startTimeMeridiem = getHourAndMeridiem(startTime)[2];

      int endTimeHour = getHourAndMeridiem(endTime)[0] == 12
          ? 0
          : getHourAndMeridiem(endTime)[0];

      int endTimeMinute = getHourAndMeridiem(endTime)[1];
      String endTimeMeridiem = getHourAndMeridiem(endTime)[2];

      _compareStartAndEndTime(
          calentreEventBloc: calentreEventBloc,
          startTimeMeridiem: startTimeMeridiem,
          endTimeMeridiem: endTimeMeridiem,
          startTimeHour: startTimeHour,
          endTimeHour: endTimeHour,
          startTimeMinute: startTimeMinute,
          endTimeMinute: endTimeMinute,
          index: index,
          day: "Mon");

      break;
    case "Tue":
      //if start time is greater than end time, return error
      calentreEventBloc.currentDay = "Tue";
      String startTime = calentreEventBloc.days.tuesday![index].start!;
      String endTime = calentreEventBloc.days.tuesday![index].end!;

      int startTimeHour = getHourAndMeridiem(startTime)[0] == 12
          ? 0
          : getHourAndMeridiem(startTime)[0];
      int startTimeMinute = getHourAndMeridiem(startTime)[1];
      String startTimeMeridiem = getHourAndMeridiem(startTime)[2];

      int endTimeHour = getHourAndMeridiem(endTime)[0] == 12
          ? 0
          : getHourAndMeridiem(endTime)[0];

      int endTimeMinute = getHourAndMeridiem(endTime)[1];
      String endTimeMeridiem = getHourAndMeridiem(endTime)[2];

      _compareStartAndEndTime(
          calentreEventBloc: calentreEventBloc,
          startTimeMeridiem: startTimeMeridiem,
          endTimeMeridiem: endTimeMeridiem,
          startTimeHour: startTimeHour,
          endTimeHour: endTimeHour,
          startTimeMinute: startTimeMinute,
          endTimeMinute: endTimeMinute,
          index: index,
          day: "Tue");

      break;
    case "Wed":
      //if start time is greater than end time, return error
      calentreEventBloc.currentDay = "Wed";
      String startTime = calentreEventBloc.days.wednesday![index].start!;
      String endTime = calentreEventBloc.days.wednesday![index].end!;

      int startTimeHour = getHourAndMeridiem(startTime)[0] == 12
          ? 0
          : getHourAndMeridiem(startTime)[0];
      int startTimeMinute = getHourAndMeridiem(startTime)[1];
      String startTimeMeridiem = getHourAndMeridiem(startTime)[2];

      int endTimeHour = getHourAndMeridiem(endTime)[0] == 12
          ? 0
          : getHourAndMeridiem(endTime)[0];

      int endTimeMinute = getHourAndMeridiem(endTime)[1];
      String endTimeMeridiem = getHourAndMeridiem(endTime)[2];

      _compareStartAndEndTime(
          calentreEventBloc: calentreEventBloc,
          startTimeMeridiem: startTimeMeridiem,
          endTimeMeridiem: endTimeMeridiem,
          startTimeHour: startTimeHour,
          endTimeHour: endTimeHour,
          startTimeMinute: startTimeMinute,
          endTimeMinute: endTimeMinute,
          index: index,
          day: "Wed");

      break;
    case "Thur":
      //if start time is greater than end time, return error
      calentreEventBloc.currentDay = "Thur";
      String startTime = calentreEventBloc.days.thursday![index].start!;
      String endTime = calentreEventBloc.days.thursday![index].end!;

      int startTimeHour = getHourAndMeridiem(startTime)[0] == 12
          ? 0
          : getHourAndMeridiem(startTime)[0];
      int startTimeMinute = getHourAndMeridiem(startTime)[1];
      String startTimeMeridiem = getHourAndMeridiem(startTime)[2];

      int endTimeHour = getHourAndMeridiem(endTime)[0] == 12
          ? 0
          : getHourAndMeridiem(endTime)[0];

      int endTimeMinute = getHourAndMeridiem(endTime)[1];
      String endTimeMeridiem = getHourAndMeridiem(endTime)[2];

      _compareStartAndEndTime(
          calentreEventBloc: calentreEventBloc,
          startTimeMeridiem: startTimeMeridiem,
          endTimeMeridiem: endTimeMeridiem,
          startTimeHour: startTimeHour,
          endTimeHour: endTimeHour,
          startTimeMinute: startTimeMinute,
          endTimeMinute: endTimeMinute,
          index: index,
          day: "Thur");

      break;
    case "Fri":
      //if start time is greater than end time, return error
      calentreEventBloc.currentDay = "Fri";
      String startTime = calentreEventBloc.days.friday![index].start!;
      String endTime = calentreEventBloc.days.friday![index].end!;

      int startTimeHour = getHourAndMeridiem(startTime)[0] == 12
          ? 0
          : getHourAndMeridiem(startTime)[0];
      int startTimeMinute = getHourAndMeridiem(startTime)[1];
      String startTimeMeridiem = getHourAndMeridiem(startTime)[2];

      int endTimeHour = getHourAndMeridiem(endTime)[0] == 12
          ? 0
          : getHourAndMeridiem(endTime)[0];

      int endTimeMinute = getHourAndMeridiem(endTime)[1];
      String endTimeMeridiem = getHourAndMeridiem(endTime)[2];

      _compareStartAndEndTime(
          calentreEventBloc: calentreEventBloc,
          startTimeMeridiem: startTimeMeridiem,
          endTimeMeridiem: endTimeMeridiem,
          startTimeHour: startTimeHour,
          endTimeHour: endTimeHour,
          startTimeMinute: startTimeMinute,
          endTimeMinute: endTimeMinute,
          index: index,
          day: "Fri");

      break;
    case "Sat":
      //if start time is greater than end time, return error
      calentreEventBloc.currentDay = "Sat";
      String startTime = calentreEventBloc.days.saturday![index].start!;
      String endTime = calentreEventBloc.days.saturday![index].end!;

      int startTimeHour = getHourAndMeridiem(startTime)[0] == 12
          ? 0
          : getHourAndMeridiem(startTime)[0];
      int startTimeMinute = getHourAndMeridiem(startTime)[1];
      String startTimeMeridiem = getHourAndMeridiem(startTime)[2];

      int endTimeHour = getHourAndMeridiem(endTime)[0] == 12
          ? 0
          : getHourAndMeridiem(endTime)[0];

      int endTimeMinute = getHourAndMeridiem(endTime)[1];
      String endTimeMeridiem = getHourAndMeridiem(endTime)[2];

      _compareStartAndEndTime(
          calentreEventBloc: calentreEventBloc,
          startTimeMeridiem: startTimeMeridiem,
          endTimeMeridiem: endTimeMeridiem,
          startTimeHour: startTimeHour,
          endTimeHour: endTimeHour,
          startTimeMinute: startTimeMinute,
          endTimeMinute: endTimeMinute,
          index: index,
          day: "Sat");

      break;
    case "Sun":
      //if start time is greater than end time, return error
      calentreEventBloc.currentDay = "Sun";
      String startTime = calentreEventBloc.days.sunday![index].start!;
      String endTime = calentreEventBloc.days.sunday![index].end!;

      int startTimeHour = getHourAndMeridiem(startTime)[0] == 12
          ? 0
          : getHourAndMeridiem(startTime)[0];
      int startTimeMinute = getHourAndMeridiem(startTime)[1];
      String startTimeMeridiem = getHourAndMeridiem(startTime)[2];

      int endTimeHour = getHourAndMeridiem(endTime)[0] == 12
          ? 0
          : getHourAndMeridiem(endTime)[0];

      int endTimeMinute = getHourAndMeridiem(endTime)[1];
      String endTimeMeridiem = getHourAndMeridiem(endTime)[2];

      _compareStartAndEndTime(
          calentreEventBloc: calentreEventBloc,
          startTimeMeridiem: startTimeMeridiem,
          endTimeMeridiem: endTimeMeridiem,
          startTimeHour: startTimeHour,
          endTimeHour: endTimeHour,
          startTimeMinute: startTimeMinute,
          endTimeMinute: endTimeMinute,
          index: index,
          day: "Sun");

      break;

    default:
      return "Start Time must be before end time ";
  }
}

void _compareStartAndEndTime(
    {required CalentreEventBloc calentreEventBloc,
    required String startTimeMeridiem,
    required String endTimeMeridiem,
    required int startTimeHour,
    required int endTimeHour,
    required int startTimeMinute,
    required int endTimeMinute,
    required int index,
    required String day}) {
  if (startTimeMeridiem == "AM" && endTimeMeridiem == "PM") {
    //success
    calentreEventBloc.isTimeError = false;
    calentreEventBloc.errorList[_getDayIndex(day)][day]![index] = false;
  } else if (startTimeMeridiem == "PM" && endTimeMeridiem == "AM") {
    calentreEventBloc.isTimeError = true;
    calentreEventBloc.errorList[_getDayIndex(day)][day]![index] = true;
  } else if (startTimeMeridiem == "AM" && endTimeMeridiem == "AM") {
    if (startTimeHour < endTimeHour) {
      calentreEventBloc.isTimeError = false;
      calentreEventBloc.errorList[_getDayIndex(day)][day]![index] = false;
    } else if (startTimeHour > endTimeHour) {
      calentreEventBloc.isTimeError = true;
      calentreEventBloc.errorList[_getDayIndex(day)][day]![index] = true;
    } else {
      if (startTimeMinute < endTimeMinute) {
        calentreEventBloc.isTimeError = false;
        calentreEventBloc.errorList[_getDayIndex(day)][day]![index] = false;
      } else {
        calentreEventBloc.isTimeError = true;
        calentreEventBloc.errorList[_getDayIndex(day)][day]![index] = true;
      }
    }
  } else if (startTimeMeridiem == "PM" && endTimeMeridiem == "PM") {
    if (startTimeHour < endTimeHour) {
      calentreEventBloc.isTimeError = false;
      calentreEventBloc.errorList[_getDayIndex(day)][day]![index] = false;
    } else if (startTimeHour > endTimeHour) {
      calentreEventBloc.isTimeError = true;
      calentreEventBloc.errorList[_getDayIndex(day)][day]![index] = true;
    } else {
      if (startTimeMinute < endTimeMinute) {
        calentreEventBloc.isTimeError = false;
        calentreEventBloc.errorList[_getDayIndex(day)][day]![index] = false;
      } else {
        calentreEventBloc.isTimeError = true;
        calentreEventBloc.errorList[_getDayIndex(day)][day]![index] = true;
      }
    }
  }
}

int _getDayIndex(String day) {
  switch (day) {
    case "Mon":
      return 0;
    case "Tue":
      return 1;
    case "Wed":
      return 2;
    case "Thur":
      return 3;
    case "Fri":
      return 4;
    case "Sat":
      return 5;
    case "Sun":
      return 6;
    default:
      return 0;
  }
}
