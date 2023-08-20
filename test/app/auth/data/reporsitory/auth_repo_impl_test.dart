import 'package:calentre/core/resources.dart';
import 'package:calentre/features/auth/data/data_sources/auth_service.dart';
import 'package:calentre/features/auth/data/repository/auth_repository_impl.dart';
import 'package:calentre/features/auth/domain/repository/auth_respository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//Mock AuthImplementation repo
class AuthServiceMock extends Mock implements AuthService {
  @override
  Future<bool> signInWithGoogle() async {
    return authResponse;
  }
}

bool authResponse = false;

void main() {
  final AuthServiceMock authServiceMock = AuthServiceMock();
  final AuthRepository authRepository = AuthRepositoryImpl(authServiceMock);
  group('Auth Repository Implementation Test ', () {
    test('//SignInWithGoogle() function Should return DataSuccess(true)',
        () async {
      authResponse = true;
      final response = await authRepository.signInWithGoogle();

      expect(response, DataSuccess<bool, Exception>(true));
    });
    test('//SignInWithGoogle() function Should return DataFailure(Exception())',
        () async {
      authResponse = false;
      final response = await authRepository.signInWithGoogle();

      expect(
          response,
          DataFailure<bool, Exception>(const AuthException(
              "Unable to sign this user in : CODE 1",
              statusCode: '500')));
    });
  });
}
