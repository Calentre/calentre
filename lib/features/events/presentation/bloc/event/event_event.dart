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
  String? videoCallType;
  Days? days;

  UpdateCalentreEventDetailsEvent(
      {this.amount,
      this.duration,
      this.eventDescription,
      this.eventLink,
      this.eventName,
      this.eventType,
      this.isMultiple,
      this.videoCallType,
      this.days});
}
