import 'package:bloc_test/bloc_test.dart';
import 'package:calentre/app/set_availability/presentation/bloc/set_availability_bloc.dart';
import 'package:calentre/app/set_availability/presentation/bloc/set_availability_event.dart';
import 'package:calentre/app/set_availability/presentation/bloc/set_availability_state.dart';
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
      "// on click FormDropDown should return FormDropDownUpdatedState(value: Apple )",
      build: () => setAvailabilityBloc(),
      act: (setAvailabilityBloc) {
        setAvailabilityBloc.add(AddExtraTimeFieldEvent());
      },
      expect: () => [ExtraTimeFieldUpdatedState(1)],
    );
  });
}
