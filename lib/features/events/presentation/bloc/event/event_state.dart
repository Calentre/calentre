import 'package:calentre/config/constants/time_list.dart';
import 'package:calentre/features/events/data/models/calentre_event.dart';
import 'package:equatable/equatable.dart';

class CalentreEventState extends Equatable {
  final String amount;
  final String duration;
  final String eventDescription;
  final String eventLink;
  final String eventName;
  final String eventType;
  final String isMultiple;
  final String videoCallType;
  final Days days;

  //constructor
  const CalentreEventState(
      {required this.eventName,
      required this.eventType,
      required this.isMultiple,
      required this.videoCallType,
      required this.days,
      required this.amount,
      required this.duration,
      required this.eventDescription,
      required this.eventLink});

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
        videoCallType: "",
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

  //clone/copyWith method
  CalentreEventState clone(
      {String? amount,
      String? duration,
      String? eventDescription,
      String? eventLink,
      String? eventName,
      String? eventType,
      String? isMultiple,
      String? videoCallType,
      Days? days}) {
    return CalentreEventState(
        eventName: eventName ?? this.amount,
        eventType: eventType ?? this.eventType,
        isMultiple: isMultiple ?? this.isMultiple,
        videoCallType: videoCallType ?? this.videoCallType,
        days: days ?? this.days,
        amount: amount ?? this.amount,
        duration: duration ?? this.duration,
        eventDescription: eventDescription ?? this.eventDescription,
        eventLink: eventLink ?? this.eventLink);
  }

//TODO:rename videoCallType to location
  @override
  List<Object?> get props => [
        amount,
        duration,
        eventDescription,
        eventLink,
        eventName,
        isMultiple,
        videoCallType,
        days
      ];
}
