import 'package:calentre/features/events/data/models/calentre_event.dart';

class TimeSlotEntity {
  final String start;
  final String end;

  TimeSlotEntity(
    this.start,
    this.end,
  );
}

/// Contains static methods for converting entity to models and models back to entity.
class TimeSlotMapper {
  static TimeSlotEntity toEntity(TimeSlotModel timeSlotModel) {
    return TimeSlotEntity(
      timeSlotModel.start,
      timeSlotModel.end,
    );
  }

  static TimeSlotModel fromEntity(TimeSlotEntity timeSlotEntity) {
    return TimeSlotModel(
      start: timeSlotEntity.start,
      end: timeSlotEntity.end,
    );
  }
}
