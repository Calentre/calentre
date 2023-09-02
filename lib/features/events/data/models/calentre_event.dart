// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'calentre_event.freezed.dart';
part 'calentre_event.g.dart';

//Build command
//flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class CalentreEvent with _$CalentreEvent {
  const factory CalentreEvent({
    String? eventName,
    String? eventDescription,
    String? videoCallType,
    String? duration,
    String? eventLink,
    String? eventType,
    String? amount,
    String? isMultiple,
    List<Day>? days,
  }) = _CalentreEvent;

  factory CalentreEvent.fromJson(Map<String, dynamic> json) =>
      _$CalentreEventFromJson(json);
}

@freezed
class Day with _$Day {
  const factory Day({
    List<TimeSlot>? monday,
    List<TimeSlot>? tuesday,
    List<TimeSlot>? wednesday,
    List<TimeSlot>? thursday,
    List<TimeSlot>? friday,
    List<TimeSlot>? saturday,
    List<TimeSlot>? sunday,
  }) = _Day;

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}

@freezed
class TimeSlot with _$TimeSlot {
  const factory TimeSlot({
    String? start,
    String? end,
  }) = _TimeSlot;

  factory TimeSlot.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotFromJson(json);
}
