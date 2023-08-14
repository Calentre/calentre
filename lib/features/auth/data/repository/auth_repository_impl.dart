import 'package:calentre/core/resources.dart';
import 'package:calentre/features/auth/data/data_sources/auth_service.dart';
import 'package:calentre/features/auth/data/models/user_model.dart';
import 'package:calentre/features/auth/domain/repository/auth_respository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._authService);
  final SupabaseClient supabase = Supabase.instance.client;

  final AuthService _authService;

  @override
  Future<DataState<CalentreUser, Exception>> signInWithGoogle() async {
    DataState<CalentreUser, Exception>? response;

    try {
      final signInResponse = await _authService.signInWithGoogle();

      if (supabase.auth.currentUser == null) {
        if (signInResponse) {
          response = DataSuccess(CalentreUser(
              userId: supabase.auth.currentUser!.id,
              name: supabase.auth.currentUser!.userMetadata!["full_name"],
              email: supabase.auth.currentUser!.email ?? "",
              avatarUrl:
                  supabase.auth.currentUser!.userMetadata!["avatar_url"]));
        } else {
          response = DataFailure(
            const AuthException("Invalid server Response", statusCode: '500'),
          );
        }
      } else if (supabase.auth.currentUser != null) {
        response = DataSuccess(CalentreUser(
            userId: supabase.auth.currentUser!.id,
            name: supabase.auth.currentUser!.userMetadata!["full_name"],
            email: supabase.auth.currentUser!.email ?? "",
            avatarUrl: supabase.auth.currentUser!.userMetadata!["avatar_url"]));
      }
    } on Exception catch (e) {
      response = DataFailure(e);
    }
    // If response is still null at this point, return a default failure response
    response ??= DataFailure(
      const AuthException("Invalid server Response", statusCode: '500'),
    );
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
