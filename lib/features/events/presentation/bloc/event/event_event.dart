import 'package:calentre/config/enums/weekdays.dart';
import 'package:calentre/features/events/data/models/calentre_event.dart';

class CalentreEventEvent {}

class ProceedToSetAvailabilityEvent extends CalentreEventEvent {}

class UpdateCalentreEventDetailsEvent extends CalentreEventEvent {
  String? amount;
  String? duration;
  String? eventDescription;
  String? eventLink;
  String? eventName;
  String? eventType;
  String? isMultiple;
  String? platformType;
  Days? days;

  UpdateCalentreEventDetailsEvent(
      {this.amount,
      this.duration,
      this.eventDescription,
      this.eventLink,
      this.eventName,
      this.eventType,
      this.isMultiple,
      this.platformType,
      this.days});
}

class UpdateDayScheduleEvent extends CalentreEventEvent {
  final int index;
  final WeekDays day;
  final String? startTime;
  final String? endTime;
  UpdateDayScheduleEvent({
    required this.index,
    required this.day,
    required this.endTime,
    required this.startTime,
  });
}

//rename to UpdateErrorList
class UpdateDayScheduleValidationEvent extends CalentreEventEvent {
  final List<Map<WeekDays, List<bool>>> errorList;

  UpdateDayScheduleValidationEvent({required this.errorList});
}

class AddNewTimeFieldEvent extends CalentreEventEvent {
  final WeekDays day;

  AddNewTimeFieldEvent({required this.day});
}

class RemoveTimeFieldEvent extends CalentreEventEvent {
  final WeekDays day;

  RemoveTimeFieldEvent({required this.day});
}
