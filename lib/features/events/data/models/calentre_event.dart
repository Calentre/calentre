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
    required String eventName,
    required String eventDescription,
    required String videoCallType,
    required String duration,
    required String eventLink,
    required String eventType,
    required String amount,
    required String isMultiple,
    required List<Availability> availability,
  }) = _CalentreEvent;

  factory CalentreEvent.fromJson(Map<String, dynamic> json) =>
      _$CalentreEventFromJson(json);
}

@freezed
class Availability with _$Availability {
  const factory Availability({
    required List<Day> monday,
    required List<Day> tuesday,
    required List<Day> wednesday,
    required List<Day> thursday,
    required List<Day> friday,
    required List<Day> saturday,
    required List<Day> sunday,
  }) = _Availability;

  factory Availability.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityFromJson(json);
}

@freezed
class Day with _$Day {
  const factory Day({
    required String start,
    required String end,
  }) = _Day;

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}
