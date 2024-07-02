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
    required AvailabilityModel availability,
  }) = _CalentreEvent;

  factory CalentreEvent.fromJson(Map<String, dynamic> json) =>
      _$CalentreEventFromJson(json);
}

@freezed
class AvailabilityModel with _$AvailabilityModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory AvailabilityModel({
    required List<TimeSlotModel> monday,
    required List<TimeSlotModel> tuesday,
    required List<TimeSlotModel> wednesday,
    required List<TimeSlotModel> thursday,
    required List<TimeSlotModel> friday,
    required List<TimeSlotModel> saturday,
    required List<TimeSlotModel> sunday,
  }) = _AvailabilityModel;

  factory AvailabilityModel.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityModelFromJson(json);
}

@freezed
class TimeSlotModel with _$TimeSlotModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TimeSlotModel({
    required String start,
    required String end,
  }) = _TimeSlotModel;

  factory TimeSlotModel.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotModelFromJson(json);
}
