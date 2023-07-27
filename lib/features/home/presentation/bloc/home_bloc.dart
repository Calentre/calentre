import 'package:calentre/features/home/presentation/bloc/home_event.dart';
import 'package:calentre/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBloc extends Bloc<HomeViewEvents, HomeViewStates> {
  int viewIndex = 0;
  HomeViewBloc() : super(InitialState()) {
    on<EventViewEvent>(onClickEventsView);
    on<HistoryViewEvent>(onClickHistoryView);
    on<PaymentViewEvent>(onClickPaymentView);
  }

  void onClickEventsView(
      EventViewEvent event, Emitter<HomeViewStates> emit) async {
    viewIndex = 0;
    emit(UpdateState(viewIndex));
  }

  void onClickHistoryView(
      HistoryViewEvent event, Emitter<HomeViewStates> emit) async {
    viewIndex = 1;
    emit(UpdateState(viewIndex));
  }

  void onClickPaymentView(
      PaymentViewEvent event, Emitter<HomeViewStates> emit) async {
    viewIndex = 2;
    emit(UpdateState(viewIndex));
  }
}
