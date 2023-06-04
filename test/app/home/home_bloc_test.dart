import 'package:bloc_test/bloc_test.dart';
import 'package:calentre/app/home/presentation/bloc/home_bloc.dart';
import 'package:calentre/app/home/presentation/bloc/home_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("HomeViewBloc Test", () {
    HomeViewBloc homeViewBloc = HomeViewBloc();

    tearDown(() {
      //Unsure about the double instantiation
      homeViewBloc.close();
    });

    test("HomeViewState should return an initialView Index of 0", () {
      expect(homeViewBloc.state, InitialState());
    });

    test("on click HistoryView", () {
      // blocTest(description, build: build)
    });
  });
}
