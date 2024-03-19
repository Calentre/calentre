import 'package:calentre/config/enums/weekdays.dart';

class SetAvailabilityEvents {
  const SetAvailabilityEvents();
}

class AddExtraTimeFieldEvent extends SetAvailabilityEvents {}

class RemoveExtraTimeFieldEvent extends SetAvailabilityEvents {}

class CheckBoxEvent extends SetAvailabilityEvents {}

class RebuildSetAvailabilityScreenEvent extends SetAvailabilityEvents {}
