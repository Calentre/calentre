import 'package:calentre/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:calentre/injection_container.dart';
import 'package:calentre/utils/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

///Responsible for initializing the stream subscription to [AuthState]
void subscribeToAuthStateChange(AuthBloc authBloc) {
  CL.log("AuthStateChanged initialized");
  sl<SupabaseClient>().auth.onAuthStateChange.listen((data) {
    final AuthChangeEvent event = data.event;
    if (event == AuthChangeEvent.signedIn ||
        event == AuthChangeEvent.tokenRefreshed) {
      authBloc.isSignedIn = true;
    } else if (event == AuthChangeEvent.signedOut ||
        event == AuthChangeEvent.userDeleted) {
      authBloc.isSignedIn = false;
    } else {}
  });
}
