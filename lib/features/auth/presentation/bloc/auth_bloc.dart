import 'package:calentre/core/DTOs/user_dto.dart';
import 'package:calentre/core/resources.dart';
import 'package:calentre/features/auth/domain/usescases/sign_in_with_google.dart';
import 'package:calentre/features/auth/presentation/bloc/auth_events.dart';
import 'package:calentre/features/auth/presentation/bloc/auth_state.dart';
import 'package:calentre/injection_container.dart';
import 'package:calentre/utils/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthBloc extends Bloc<AuthEvents, AuthUserState> {
  bool? isSignedIn;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final SupabaseClient supabase = Supabase.instance.client;

  AuthBloc(this._signInWithGoogleUseCase)
      : super(const UserSignInInitialState()) {
    on<SignInWithGoogleEvent>(onSignInWithGoogle);
  }

  void onSignInWithGoogle(
      SignInWithGoogleEvent event, Emitter<AuthUserState> emit) async {
    emit(const UserSignInLoading());

    final dataState = await _signInWithGoogleUseCase();

    if (dataState is DataSuccess && dataState.data != null) {
      // emit(UserSignInDone(dataState.data!));

      final authSubscription = supabase.auth.onAuthStateChange.listen((data) {
        final AuthChangeEvent event = data.event;
        if (event == AuthChangeEvent.signedIn) {
          sl.get<UserDTO>().email = dataState.data!.email;
          sl.get<UserDTO>().fullName = dataState.data!.name;
          sl.get<UserDTO>().userId = dataState.data!.userId;
          CL.log("In sub}");
        }
      });
      CL.log("Outside sub }");

      emit(UserSignInDone(dataState.data!));
    }

    if (dataState is DataFailure) {
      emit(UserSignInError(dataState.exception!));
      CL.logError(
          "There was an error signing in with Google ${dataState.exception}");
    }
  }
}
