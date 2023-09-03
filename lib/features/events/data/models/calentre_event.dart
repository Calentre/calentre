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
    List<Availability>? availability,
  }) = _CalentreEvent;

  factory CalentreEvent.fromJson(Map<String, dynamic> json) =>
      _$CalentreEventFromJson(json);
}

@freezed
class Availability with _$Availability {
  const factory Availability({
    List<Day>? monday,
    List<Day>? tuesday,
    List<Day>? wednesday,
    List<Day>? thursday,
    List<Day>? friday,
    List<Day>? saturday,
    List<Day>? sunday,
  }) = _Availability;

  factory Availability.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityFromJson(json);
}

@freezed
class Day with _$Day {
  const factory Day({
    String? start,
    String? end,
  }) = _Day;

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}
