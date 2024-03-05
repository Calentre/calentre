import 'package:calentre/shared/widgets/form_drop_down/bloc/form_drop_down_event.dart';
import 'package:calentre/shared/widgets/form_drop_down/bloc/form_drop_down_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormDropDownBloc extends Bloc<FormDropDownEvents, FormDropDownState> {
  String dropDownValue = "";
  FormDropDownBloc() : super(FormDropDownInitialState()) {
    on<SelectDropDownValueEvent>(onClickDropDownItem);
    on<RebuildDropDownEvent>(onTriggerRebuild);
  }

  void onClickDropDownItem(
      SelectDropDownValueEvent event, Emitter<FormDropDownState> emit) async {
    emit(FormDropDownUpdatedState(value: dropDownValue));
  }

  void onTriggerRebuild(
      RebuildDropDownEvent event, Emitter<FormDropDownState> emit) {
    print("FormDropDownBloc rebuild triggered");
    emit(RebuildDropDownState());
  }
}
