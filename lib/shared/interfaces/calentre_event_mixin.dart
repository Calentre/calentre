import 'package:calentre/config/constants/time_list.dart';
import 'package:calentre/features/events/data/models/calentre_event.dart';

///Defines an interface that that defines `CalentreEvent` state
abstract class CalentreEventMixin {
  final String eventName = "";
  final String eventDescription = "";
  final String videoCallType = "";
  final String duration = "";
  final String eventLink = "";
  final String eventType = "";
  final String amount = "";
  final String isMultiple = "";
  final Days days = Days(
    monday: [
      TimeSlot(start: TimeList().timeList.first, end: TimeList().timeList[1])
    ],
    tuesday: [
      TimeSlot(start: TimeList().timeList.first, end: TimeList().timeList[1])
    ],
    wednesday: [
      TimeSlot(start: TimeList().timeList.first, end: TimeList().timeList[1])
    ],
    thursday: [
      TimeSlot(start: TimeList().timeList.first, end: TimeList().timeList[1])
    ],
    friday: [
      TimeSlot(start: TimeList().timeList.first, end: TimeList().timeList[1])
    ],
    saturday: [
      TimeSlot(start: TimeList().timeList.first, end: TimeList().timeList[1])
    ],
    sunday: [
      TimeSlot(start: TimeList().timeList.first, end: TimeList().timeList[1])
    ],
  );
}
