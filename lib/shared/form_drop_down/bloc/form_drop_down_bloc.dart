import 'package:calentre/shared/form_drop_down/bloc/platform_drop_down_event.dart';
import 'package:calentre/shared/form_drop_down/bloc/platform_drop_down_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormDropDownBloc extends Bloc<FormDropDownEvents, FormDropDownState> {
  String dropDownValue = "";
  FormDropDownBloc() : super(FormDropDownInitialState()) {
    on<SelectDropDownValueEvent>(onClickDropDownItem);
  }

  void onClickDropDownItem(
      SelectDropDownValueEvent event, Emitter<FormDropDownState> emit) async {
    emit(FormDropDownUpdatedState(value: dropDownValue));
  }
}
