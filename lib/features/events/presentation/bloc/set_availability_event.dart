import 'package:calentre/config/enums/weekdays.dart';

class SetAvailabilityEvents {
  const SetAvailabilityEvents();
}

class AddExtraTimeFieldEvent extends SetAvailabilityEvents {}

class RemoveExtraTimeFieldEvent extends SetAvailabilityEvents {}

class CheckBoxEvent extends SetAvailabilityEvents {}

class UpdateDayScheduleEvent extends SetAvailabilityEvents {
  final int index;
  final WeekDays day;
  final String? startTime;
  final String? endTime;
  const UpdateDayScheduleEvent(
      {required this.index,
      required this.day,
      required this.endTime,
      required this.startTime});
}

class RebuildSetAvailabilityScreenEvent extends SetAvailabilityEvents {}
