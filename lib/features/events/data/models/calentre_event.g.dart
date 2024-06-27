// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calentre_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CalentreEvent _$$_CalentreEventFromJson(Map<String, dynamic> json) =>
    _$_CalentreEvent(
      eventName: json['event_name'] as String,
      eventDescription: json['event_description'] as String,
      platformType: json['platform_type'] as String,
      duration: json['duration'] as String,
      eventLink: json['event_link'] as String,
      eventType: json['event_type'] as String,
      amount: json['amount'] as String,
      isMultiple: json['is_multiple'] as bool?,
      availability: Days.fromJson(json['availability'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CalentreEventToJson(_$_CalentreEvent instance) =>
    <String, dynamic>{
      'event_name': instance.eventName,
      'event_description': instance.eventDescription,
      'platform_type': instance.platformType,
      'duration': instance.duration,
      'event_link': instance.eventLink,
      'event_type': instance.eventType,
      'amount': instance.amount,
      'is_multiple': instance.isMultiple,
      'availability': instance.availability.toJson(),
    };

_$_Days _$$_DaysFromJson(Map<String, dynamic> json) => _$_Days(
      monday: (json['monday'] as List<dynamic>)
          .map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      tuesday: (json['tuesday'] as List<dynamic>)
          .map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      wednesday: (json['wednesday'] as List<dynamic>)
          .map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      thursday: (json['thursday'] as List<dynamic>)
          .map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      friday: (json['friday'] as List<dynamic>)
          .map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      saturday: (json['saturday'] as List<dynamic>)
          .map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      sunday: (json['sunday'] as List<dynamic>)
          .map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DaysToJson(_$_Days instance) => <String, dynamic>{
      'monday': instance.monday.map((e) => e.toJson()).toList(),
      'tuesday': instance.tuesday.map((e) => e.toJson()).toList(),
      'wednesday': instance.wednesday.map((e) => e.toJson()).toList(),
      'thursday': instance.thursday.map((e) => e.toJson()).toList(),
      'friday': instance.friday.map((e) => e.toJson()).toList(),
      'saturday': instance.saturday.map((e) => e.toJson()).toList(),
      'sunday': instance.sunday.map((e) => e.toJson()).toList(),
    };

_$_TimeSlot _$$_TimeSlotFromJson(Map<String, dynamic> json) => _$_TimeSlot(
      start: json['start'] as String,
      end: json['end'] as String,
    );

Map<String, dynamic> _$$_TimeSlotToJson(_$_TimeSlot instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
    };
