import 'package:bloc_test/bloc_test.dart';
import 'package:calentre/shared/widgets/form_drop_down/bloc/form_drop_down_bloc.dart';
import 'package:calentre/shared/widgets/form_drop_down/bloc/form_drop_down_event.dart';
import 'package:calentre/shared/widgets/form_drop_down/bloc/form_drop_down_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("FormDropDown Bloc Test", () {
    FormDropDownBloc formDropDownBloc() {
      return FormDropDownBloc();
    }

    test(
        "// FormDropDown should return FormDropDownInitialState() class as initial state",
        () {
      expect(formDropDownBloc().state, FormDropDownInitialState());
    });

    blocTest(
      "// on click FormDropDown should return FormDropDownUpdatedState(value: Apple )",
      build: () => formDropDownBloc(),
      act: (formDropDownBloc) {
        formDropDownBloc.dropDownValue = "Apple";
        formDropDownBloc.add(SelectDropDownValueEvent());
      },
      expect: () => [FormDropDownUpdatedState(value: "Apple")],
    );
  });
}
