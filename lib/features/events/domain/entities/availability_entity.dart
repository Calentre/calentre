import 'package:calentre/features/events/data/models/calentre_event.dart';
import 'package:calentre/features/events/domain/entities/time_slot_enitity.dart';

class AvailabilityEntity {
  final List<TimeSlotEntity> monday;
  final List<TimeSlotEntity> tuesday;
  final List<TimeSlotEntity> wednesday;
  final List<TimeSlotEntity> thursday;
  final List<TimeSlotEntity> friday;
  final List<TimeSlotEntity> saturday;
  final List<TimeSlotEntity> sunday;

  AvailabilityEntity(
      {required this.monday,
      required this.tuesday,
      required this.wednesday,
      required this.thursday,
      required this.friday,
      required this.saturday,
      required this.sunday});
}

/// Contains static methods for converting entity to models and models back to entity.
class AvailabilityMapper {
  static AvailabilityEntity toEntity(AvailabilityModel availabilityModel) {
    final monday = mapTimeSlotToModel(availabilityModel.monday);
    final tuesday = mapTimeSlotToModel(availabilityModel.tuesday);
    final wednesday = mapTimeSlotToModel(availabilityModel.wednesday);
    final thursday = mapTimeSlotToModel(availabilityModel.thursday);
    final friday = mapTimeSlotToModel(availabilityModel.friday);
    final saturday = mapTimeSlotToModel(availabilityModel.saturday);
    final sunday = mapTimeSlotToModel(availabilityModel.sunday);

    return AvailabilityEntity(
        monday: monday,
        tuesday: tuesday,
        wednesday: wednesday,
        thursday: thursday,
        friday: friday,
        saturday: saturday,
        sunday: sunday);
  }

  static AvailabilityModel fromEntity(AvailabilityEntity availabilityEntity) {
    final monday = mapTimeSlotToEntity(availabilityEntity.monday);
    final tuesday = mapTimeSlotToEntity(availabilityEntity.tuesday);
    final wednesday = mapTimeSlotToEntity(availabilityEntity.wednesday);
    final thursday = mapTimeSlotToEntity(availabilityEntity.thursday);
    final friday = mapTimeSlotToEntity(availabilityEntity.friday);
    final saturday = mapTimeSlotToEntity(availabilityEntity.saturday);
    final sunday = mapTimeSlotToEntity(availabilityEntity.sunday);
    return AvailabilityModel(
        monday: monday,
        tuesday: tuesday,
        wednesday: wednesday,
        thursday: thursday,
        friday: friday,
        saturday: saturday,
        sunday: sunday);
  }
}

List<TimeSlotModel> mapTimeSlotToEntity(List<TimeSlotEntity> timeSlots) {
  return timeSlots.map((t) => TimeSlotMapper.fromEntity(t)).toList();
}

List<TimeSlotEntity> mapTimeSlotToModel(List<TimeSlotModel> timeSlots) {
  return timeSlots.map((t) => TimeSlotMapper.toEntity(t)).toList();
}
