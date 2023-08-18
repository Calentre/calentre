import 'package:bloc_test/bloc_test.dart';
import 'package:calentre/features/events/presentation/bloc/set_availability_bloc.dart';
import 'package:calentre/features/events/presentation/bloc/set_availability_event.dart';
import 'package:calentre/features/events/presentation/bloc/set_availability_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("SetAvailabilityBloc Bloc Test", () {
    SetAvailabilityBloc setAvailabilityBloc() {
      return SetAvailabilityBloc();
    }

    test(
        "// SetAvailabilityBloc should return ExtraTimeFieldInitialState() class as initial state",
        () {
      expect(setAvailabilityBloc().state, ExtraTimeFieldInitialState());
    });

    blocTest(
      "// AddExtraTimeFieldEvent() should return ExtraTimeFieldUpdatedState(1)",
      build: () => setAvailabilityBloc(),
      act: (setAvailabilityBloc) {
        setAvailabilityBloc.add(AddExtraTimeFieldEvent());
      },
      expect: () => [ExtraTimeFieldUpdatedState(1)],
    );
    blocTest(
      "// RemoveExtraTimeFieldEvent() should not return any state",
      build: () => setAvailabilityBloc(),
      act: (setAvailabilityBloc) {
        setAvailabilityBloc.add(RemoveExtraTimeFieldEvent());
      },
      //returns an empty list because no state is emmitted when listLength < 0
      expect: () => [],
    );

    blocTest(
      "// RemoveExtraTimeFieldEvent() should return ExtraTimeFieldUpdatedState(1)",
      build: () => setAvailabilityBloc(),
      act: (setAvailabilityBloc) {
        setAvailabilityBloc.listLength = 2;
        setAvailabilityBloc.add(RemoveExtraTimeFieldEvent());
      },
      //returns an empty list because no state is emmitted when listLength < 0
      expect: () => [ExtraTimeFieldUpdatedState(1)],
    );
    blocTest(
      "// CheckBoxEvent() should return CheckBoxUpdatedState(false)",
      build: () => setAvailabilityBloc(),
      act: (setAvailabilityBloc) {
        setAvailabilityBloc.add(CheckBoxEvent());
      },
      expect: () => [CheckBoxUpdatedState(false)],
    );
    blocTest(
      "// CheckBoxEvent() should return CheckBoxUpdatedState(true)",
      build: () => setAvailabilityBloc(),
      act: (setAvailabilityBloc) {
        setAvailabilityBloc.checkBoxState = false;
        setAvailabilityBloc.add(CheckBoxEvent());
      },
      expect: () => [CheckBoxUpdatedState(true)],
    );
  });
}
