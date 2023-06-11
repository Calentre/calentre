import 'package:calentre/app/create_events/presentation/bloc/platform_drop_down_event.dart';
import 'package:calentre/app/create_events/presentation/bloc/platform_drop_down_state.dart';
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
