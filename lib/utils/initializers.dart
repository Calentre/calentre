import 'package:calentre/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:calentre/injection_container.dart';
import 'package:calentre/utils/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void subscribeToAuthStateChange(AuthBloc authBloc) {
  final sub = sl<SupabaseClient>().auth.onAuthStateChange.listen((data) {
    final AuthChangeEvent event = data.event;
    if (event == AuthChangeEvent.signedIn ||
        event == AuthChangeEvent.tokenRefreshed) {
      authBloc.isSignedIn = true;
      CL.logSuccess("This user has signed In from initializerrrr");
    } else if (event == AuthChangeEvent.signedOut ||
        event == AuthChangeEvent.userDeleted) {
      authBloc.isSignedIn = false;
      CL.logSuccess("This user has signed out from initializer");
    } else {
      CL.logSuccess("This user has some other state from initializer");
      print(event);
    }
  });
}
