import 'package:calentre/core/DTOs/user_dto.dart';
import 'package:calentre/core/resources.dart';
import 'package:calentre/features/auth/domain/usescases/sign_in_with_google.dart';
import 'package:calentre/features/auth/presentation/bloc/auth_events.dart';
import 'package:calentre/features/auth/presentation/bloc/auth_state.dart';
import 'package:calentre/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvents, AuthUserState> {
  bool? isSignedIn;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;

  AuthBloc(this._signInWithGoogleUseCase)
      : super(const UserSignInInitialState()) {
    on<SignInWithGoogleEvent>(onSignInWithGoogle);
  }

  void onSignInWithGoogle(
      SignInWithGoogleEvent event, Emitter<AuthUserState> emit) async {
    emit(const UserSignInLoading());
    //call the sign in API
    final dataState = await _signInWithGoogleUseCase();

    //check if successful and set isSignedIn accordingly.
    if (dataState is DataSuccess && dataState.data != null) {
      //update UserDTO with userDetails
      emit(UserSignInDone(dataState.data!));
      sl.get<UserDTO>().email = dataState.data!.email;
      sl.get<UserDTO>().fullName = dataState.data!.name;
      sl.get<UserDTO>().userId = dataState.data!.userId;

      debugPrint("The user email is ${sl.get<UserDTO>().email}");
    }

    if (dataState is DataFailure) {
      emit(UserSignInError(dataState.exception!));
      // ANSI escape codes for changing text color
      String redColorCode = '\x1B[31m'; // Red
      String greenColorCode = '\x1B[32m'; // Green
      String resetColorCode = '\x1B[0m'; // Reset to default color
      print('$redColorCode THere is an error.${dataState.exception}');
      print('$greenColorCode There is an error.$resetColorCode');
    }
  }
}
