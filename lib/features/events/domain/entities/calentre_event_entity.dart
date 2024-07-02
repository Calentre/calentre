import 'package:calentre/features/events/data/models/calentre_event.dart';
import 'package:calentre/features/events/domain/entities/availability_entity.dart';

class CalentreEventEntity {
  final String eventName;
  final String eventDescription;
  final String platformType;
  final String duration;
  final String eventLink;
  final String eventType;
  final num? amount;
  final bool isMultiple = false;
  final AvailabilityEntity availability;

  CalentreEventEntity(
      this.eventName,
      this.eventDescription,
      this.platformType,
      this.duration,
      this.eventLink,
      this.eventType,
      this.amount,
      this.availability);
}

/// Contains static methods for converting entity to models and models back to entity.
class CalentreEventMapper {
  /// returns an instance of the [CalentreEventEntity] class.
  static CalentreEventEntity toEntity(CalentreEvent calentreEventModel) {
    return CalentreEventEntity(
      calentreEventModel.eventName,
      calentreEventModel.eventDescription,
      calentreEventModel.platformType,
      calentreEventModel.duration,
      calentreEventModel.eventLink,
      calentreEventModel.eventType,
      calentreEventModel.amount,
      mapToEntity(calentreEventModel.availability),
    );
  }

  /// returns an instance of the [CalentreEvent] model class.
  static CalentreEvent fromEntity(CalentreEventEntity calentreEventEntity) {
    return CalentreEvent(
        eventName: calentreEventEntity.eventName,
        eventDescription: calentreEventEntity.eventDescription,
        platformType: calentreEventEntity.platformType,
        duration: calentreEventEntity.duration,
        eventLink: calentreEventEntity.eventLink,
        eventType: calentreEventEntity.eventType,
        amount: calentreEventEntity.amount,
        availability: mapToModel(calentreEventEntity.availability));
  }
}

AvailabilityEntity mapToEntity(AvailabilityModel availabilityModel) {
  return AvailabilityMapper.toEntity(availabilityModel);
}

AvailabilityModel mapToModel(AvailabilityEntity availabilityEntity) {
  return AvailabilityMapper.fromEntity(availabilityEntity);
}
