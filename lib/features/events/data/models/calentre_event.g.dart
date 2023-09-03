// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calentre_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CalentreEvent _$$_CalentreEventFromJson(Map<String, dynamic> json) =>
    _$_CalentreEvent(
      eventName: json['eventName'] as String?,
      eventDescription: json['eventDescription'] as String?,
      videoCallType: json['videoCallType'] as String?,
      duration: json['duration'] as String?,
      eventLink: json['eventLink'] as String?,
      eventType: json['eventType'] as String?,
      amount: json['amount'] as String?,
      isMultiple: json['isMultiple'] as String?,
      days: json['days'] == null
          ? null
          : Days.fromJson(json['days'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CalentreEventToJson(_$_CalentreEvent instance) =>
    <String, dynamic>{
      'eventName': instance.eventName,
      'eventDescription': instance.eventDescription,
      'videoCallType': instance.videoCallType,
      'duration': instance.duration,
      'eventLink': instance.eventLink,
      'eventType': instance.eventType,
      'amount': instance.amount,
      'isMultiple': instance.isMultiple,
      'days': instance.days,
    };

_$_Days _$$_DaysFromJson(Map<String, dynamic> json) => _$_Days(
      monday: (json['monday'] as List<dynamic>?)
          ?.map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      tuesday: (json['tuesday'] as List<dynamic>?)
          ?.map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      wednesday: (json['wednesday'] as List<dynamic>?)
          ?.map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      thursday: (json['thursday'] as List<dynamic>?)
          ?.map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      friday: (json['friday'] as List<dynamic>?)
          ?.map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      saturday: (json['saturday'] as List<dynamic>?)
          ?.map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
      sunday: (json['sunday'] as List<dynamic>?)
          ?.map((e) => TimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DaysToJson(_$_Days instance) => <String, dynamic>{
      'monday': instance.monday,
      'tuesday': instance.tuesday,
      'wednesday': instance.wednesday,
      'thursday': instance.thursday,
      'friday': instance.friday,
      'saturday': instance.saturday,
      'sunday': instance.sunday,
    };

_$_TimeSlot _$$_TimeSlotFromJson(Map<String, dynamic> json) => _$_TimeSlot(
      start: json['start'] as String?,
      end: json['end'] as String?,
    );

Map<String, dynamic> _$$_TimeSlotToJson(_$_TimeSlot instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
    };
