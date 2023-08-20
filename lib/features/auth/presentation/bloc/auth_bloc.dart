import 'package:calentre/core/resources.dart';
import 'package:calentre/features/auth/domain/usescases/sign_in_with_google.dart';
import 'package:calentre/features/auth/presentation/bloc/auth_events.dart';
import 'package:calentre/features/auth/presentation/bloc/auth_state.dart';
import 'package:calentre/utils/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

///Bloc class that handles all authentication methods within calentre
class AuthBloc extends Bloc<AuthEvents, AuthUserState> {
  bool? isSignedIn;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;

  AuthBloc(this._signInWithGoogleUseCase)
      : super(const UserSignInInitialState()) {
    on<SignInWithGoogleEvent>(onSignInWithGoogle);
  }

  //this method uses on UserSignInLoading state because of supabase
  //implementation of Google signIn
  void onSignInWithGoogle(
      SignInWithGoogleEvent event, Emitter<AuthUserState> emit) async {
    emit(const UserSignInLoading());
    final dataState = await _signInWithGoogleUseCase();
    if (dataState is DataSuccess && dataState.data != null) {
      isSignedIn = true;
    }

    if (dataState is DataFailure) {
      isSignedIn = false;
      emit(UserSignInError(dataState.exception!, isSignedIn!));
      if (dataState.exception is AuthException) {}
      CL.logError(
          "There was an error signing in with Google ${dataState.exception}");
    }
  }
}
