// This file is "main.dart"
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'calentre_event.freezed.dart';
part 'calentre_event.g.dart';

//Build command
//flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class CalentreEvent with _$CalentreEvent {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory CalentreEvent({
    required String eventName,
    required String eventDescription,
    required String platformType,
    required String duration,
    required String eventLink,
    required String eventType,
    num? amount,
    bool? isMultiple, //not supporting this feature at the moment
    required Days availability,
  }) = _CalentreEvent;

  factory CalentreEvent.fromJson(Map<String, dynamic> json) =>
      _$CalentreEventFromJson(json);
}

@freezed
class Days with _$Days {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
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
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TimeSlot({
    required String start,
    required String end,
  }) = _TimeSlot;

  factory TimeSlot.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotFromJson(json);
}
