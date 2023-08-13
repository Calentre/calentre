import 'package:calentre/core/resources.dart';
import 'package:calentre/features/auth/domain/usescases/sign_in_with_google.dart';
import 'package:calentre/features/auth/presentation/bloc/auth_events.dart';
import 'package:calentre/features/auth/presentation/bloc/auth_state.dart';
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
    //call the sign in API
    final dataState = await _signInWithGoogleUseCase();

    //check if successful and set isSignedIn accordingly.
    if (dataState is DataSuccess && dataState.data != null) {
      emit(UserSignInDone(dataState.data!));
    }

    if (dataState is DataFailure) {
      emit(UserSignInError(dataState.exception!));
    }
  }
}
