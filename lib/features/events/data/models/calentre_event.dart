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
    String? platformType,
    String? duration,
    String? eventLink,
    String? eventType,
    String? amount,
    String? isMultiple,
    required Days days,
  }) = _CalentreEvent;

  factory CalentreEvent.fromJson(Map<String, dynamic> json) =>
      _$CalentreEventFromJson(json);
}

@freezed
class Days with _$Days {
  const factory Days({
    required List<TimeSlot> monday,
    required List<TimeSlot> tuesday,
    required List<TimeSlot> wednesday,
    required List<TimeSlot> thursday,
    required List<TimeSlot> friday,
    required List<TimeSlot> saturday,
    required List<TimeSlot> sunday,
  }) = _Days;

  factory Days.fromJson(Map<String, dynamic> json) => _$DaysFromJson(json);
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
