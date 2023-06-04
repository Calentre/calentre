import 'package:bloc_test/bloc_test.dart';
import 'package:calentre/app/home/presentation/bloc/home_bloc.dart';
import 'package:calentre/app/home/presentation/bloc/home_event.dart';
import 'package:calentre/app/home/presentation/bloc/home_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("HomeViewBloc Test", () {
    HomeViewBloc homeViewBloc() {
      return HomeViewBloc();
    }

    test("// HomeViewState should return InitialState() class as initial state",
        () {
      expect(homeViewBloc().state, InitialState());
    });

    blocTest(
      "// on click EventsView should return UpdateState(viewIndex: 0)",
      build: () => homeViewBloc(),
      act: (homeViewBloc) {
        return homeViewBloc.add(EventViewEvent());
      },
      expect: () => [UpdateState(0)],
    );
    blocTest(
      "// on click HistoryView should return UpdateState(viewIndex: 1)",
      build: () => homeViewBloc(),
      act: (homeViewBloc) {
        return homeViewBloc.add(HistoryViewEvent());
      },
      expect: () => [UpdateState(1)],
    );
    blocTest(
      "// on click PaymentView should return UpdateState(viewIndex: 2)",
      build: () => homeViewBloc(),
      act: (homeViewBloc) {
        return homeViewBloc.add(PaymentViewEvent());
      },
      expect: () => [UpdateState(2)],
    );
  });
}
