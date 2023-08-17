import 'package:calentre/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:calentre/injection_container.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void subscribeToAuthStateChange(AuthBloc authBloc) {
  sl<SupabaseClient>().auth.onAuthStateChange.listen((data) {
    final AuthChangeEvent event = data.event;
    if (event == AuthChangeEvent.signedIn) {
      authBloc.isSignedIn = true;
    } else if (event == AuthChangeEvent.signedOut ||
        event == AuthChangeEvent.userDeleted) {
      authBloc.isSignedIn = false;
    }
  });
}
