import 'package:calentre/shared/form_drop_down/bloc/form_drop_down_event.dart';
import 'package:calentre/shared/form_drop_down/bloc/form_drop_down_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormDropDownBloc extends Bloc<FormDropDownEvents, FormDropDownState> {
  String dropDownValue = "";
  FormDropDownBloc() : super(FormDropDownInitialState()) {
    on<SelectDropDownValueEvent>(onClickDropDownItem);
  }

  void onClickDropDownItem(
      SelectDropDownValueEvent event, Emitter<FormDropDownState> emit) async {
    print("Drop down value is $dropDownValue");
    emit(FormDropDownUpdatedState(value: dropDownValue));
  }
}
