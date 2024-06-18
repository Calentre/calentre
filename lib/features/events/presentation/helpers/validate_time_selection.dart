import 'package:calentre/config/enums/weekdays.dart';
import 'package:calentre/utils/get_time_from_meridiem.dart';

///Returns true if the [startTime] is greater than or equal to [endTime]
bool validateTimeSelection({
  required WeekDays day,
  required String startTime,
  required String endTime,
  required int index,
}) {
  switch (day) {
    case WeekDays.monday:
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

      return _compareStartAndEndTime(
        startTimeMeridiem: startTimeMeridiem,
        endTimeMeridiem: endTimeMeridiem,
        startTimeHour: startTimeHour,
        endTimeHour: endTimeHour,
        startTimeMinute: startTimeMinute,
        endTimeMinute: endTimeMinute,
        index: index,
      );
    case WeekDays.tuesday:
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

      return _compareStartAndEndTime(
        startTimeMeridiem: startTimeMeridiem,
        endTimeMeridiem: endTimeMeridiem,
        startTimeHour: startTimeHour,
        endTimeHour: endTimeHour,
        startTimeMinute: startTimeMinute,
        endTimeMinute: endTimeMinute,
        index: index,
      );
    case WeekDays.wednesday:
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

      return _compareStartAndEndTime(
        startTimeMeridiem: startTimeMeridiem,
        endTimeMeridiem: endTimeMeridiem,
        startTimeHour: startTimeHour,
        endTimeHour: endTimeHour,
        startTimeMinute: startTimeMinute,
        endTimeMinute: endTimeMinute,
        index: index,
      );
    case WeekDays.thursday:
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

      return _compareStartAndEndTime(
        startTimeMeridiem: startTimeMeridiem,
        endTimeMeridiem: endTimeMeridiem,
        startTimeHour: startTimeHour,
        endTimeHour: endTimeHour,
        startTimeMinute: startTimeMinute,
        endTimeMinute: endTimeMinute,
        index: index,
      );
    case WeekDays.friday:
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

      return _compareStartAndEndTime(
        startTimeMeridiem: startTimeMeridiem,
        endTimeMeridiem: endTimeMeridiem,
        startTimeHour: startTimeHour,
        endTimeHour: endTimeHour,
        startTimeMinute: startTimeMinute,
        endTimeMinute: endTimeMinute,
        index: index,
      );
    case WeekDays.saturday:
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

      return _compareStartAndEndTime(
        startTimeMeridiem: startTimeMeridiem,
        endTimeMeridiem: endTimeMeridiem,
        startTimeHour: startTimeHour,
        endTimeHour: endTimeHour,
        startTimeMinute: startTimeMinute,
        endTimeMinute: endTimeMinute,
        index: index,
      );
    case WeekDays.sunday:
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

      return _compareStartAndEndTime(
        startTimeMeridiem: startTimeMeridiem,
        endTimeMeridiem: endTimeMeridiem,
        startTimeHour: startTimeHour,
        endTimeHour: endTimeHour,
        startTimeMinute: startTimeMinute,
        endTimeMinute: endTimeMinute,
        index: index,
      );

    default:
      return false;
  }
}

///Returns true if the [startTime] is greater than or equal to [endTime]
bool _compareStartAndEndTime({
  required String startTimeMeridiem,
  required String endTimeMeridiem,
  required int startTimeHour,
  required int endTimeHour,
  required int startTimeMinute,
  required int endTimeMinute,
  required int index,
}) {
  if (startTimeMeridiem == "AM" && endTimeMeridiem == "PM") {
    //success
    return false;
  } else if (startTimeMeridiem == "PM" && endTimeMeridiem == "AM") {
    return true;
  } else if (startTimeMeridiem == "AM" && endTimeMeridiem == "AM") {
    if (startTimeHour < endTimeHour) {
      return false;
    } else if (startTimeHour > endTimeHour) {
      return true;
    } else {
      if (startTimeMinute < endTimeMinute) {
        return false;
      } else {
        return true;
      }
    }
  } else if (startTimeMeridiem == "PM" && endTimeMeridiem == "PM") {
    if (startTimeHour < endTimeHour) {
      return false;
    } else if (startTimeHour > endTimeHour) {
      return true;
    } else {
      if (startTimeMinute < endTimeMinute) {
        return true;
      } else {
        return true;
      }
    }
  }
  return false;
}
