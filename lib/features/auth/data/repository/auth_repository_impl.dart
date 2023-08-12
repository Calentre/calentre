import 'package:calentre/core/resources.dart';
import 'package:calentre/features/auth/data/data_sources/auth_service.dart';
import 'package:calentre/features/auth/data/models/user_model.dart';
import 'package:calentre/features/auth/domain/repository/auth_respository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._authService);

  final AuthService _authService;
  @override
  Future<DataState> signInWithEmail() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<CalentreUser, Exception>> signInWithGoogle() async {
    try {
      final signInResponse = await _authService.signInWithGoogle();

      if (signInResponse != null) {
        return DataSuccess(signInResponse);
      } else {
        return DataFailure(
            const AuthException("couldn't signin this google user"));
      }
    } on Exception catch (e) {
      return DataFailure(e);
    }
  }

  @override
  Future<DataState> signInWithLinkedIn() {
    // TODO: implement signInWithLinkedIn
    throw UnimplementedError();
  }

  @override
  Future<DataState> signInWithSlack() {
    // TODO: implement signInWithSlack
    throw UnimplementedError();
  }
}
