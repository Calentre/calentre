import 'package:calentre/core/resources.dart';
import 'package:calentre/features/auth/data/data_sources/auth_service.dart';
import 'package:calentre/features/auth/data/models/user_model.dart';
import 'package:calentre/features/auth/domain/repository/auth_respository.dart';
import 'package:calentre/utils/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

///This class is responsible for
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._authService);
  final SupabaseClient supabase = Supabase.instance.client;
  final AuthService _authService;
  User? supabaseCurrentUser;

  @override
  Future<DataState<CalentreUser, Exception>> signInWithGoogle() async {
    DataState<CalentreUser, Exception>? response;

    try {
      bool isSuccessful = await _authService.signInWithGoogle();

      if (isSuccessful) {
        //listen to authstate changes to process successful signin
        final sub1 = supabase.auth.onAuthStateChange.listen((data) {
          final AuthChangeEvent event = data.event;
          if (event == AuthChangeEvent.signedIn) {
            supabaseCurrentUser = supabase.auth.currentUser;
            // CL.log(
            //     "Current user after AuthstateChange is: $supabaseCurrentUser");
            // CL.log("Current session after AuthstateChange is: ${data.session}");
            // CL.log("Current session is ${supabase.auth.currentSession}");
          }
          if (event == AuthChangeEvent.signedOut) {
            supabaseCurrentUser = supabase.auth.currentUser;
            // CL.log("Current user after signout is is: $supabaseCurrentUser");
          }
        });

        // sub1.cancel();
        CL.log("Current session is ${supabase.auth.currentSession}");

        supabaseCurrentUser = supabase.auth.currentUser;
        CL.log("Current user after in in: $supabaseCurrentUser");

        if (supabaseCurrentUser != null) {
          final calentreUser = CalentreUser(
              userId: supabaseCurrentUser!.id,
              name: supabaseCurrentUser!.userMetadata!["full_name"],
              email: supabaseCurrentUser!.email!);
          return DataSuccess(calentreUser);
        } else {
          return DataFailure(const AuthException("Invalid server Response",
              statusCode: '500'));
        }
      } else {
        return DataFailure(
            const AuthException("Fatal response", statusCode: '500'));
      }
    } on Exception catch (e) {
      response = DataFailure(e);
    }

    return response;
  }

  @override
  Future<DataState> signInWithEmail() {
    throw UnimplementedError();
  }

  @override
  Future<DataState> signInWithLinkedIn() {
    throw UnimplementedError();
  }

  @override
  Future<DataState> signInWithSlack() {
    throw UnimplementedError();
  }
}
