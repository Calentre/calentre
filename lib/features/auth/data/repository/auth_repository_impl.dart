import 'dart:io';

import 'package:calentre/core/resources.dart';
import 'package:calentre/features/auth/data/data_sources/auth_service.dart';
import 'package:calentre/features/auth/domain/repository/auth_respository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

///This class is responsible for
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._authService);
  final AuthService _authService;
  User? supabaseCurrentUser;

  @override
  Future<DataState<bool, Exception>> signInWithGoogle() async {
    DataState<bool, Exception>? response;

    try {
      bool isSuccessful = await _authService.signInWithGoogle();

      if (isSuccessful) {
        response = DataSuccess(isSuccessful);
        return response;
      } else {
        return DataFailure(const AuthException(
            "Unable to sign this user in : CODE 1",
            statusCode: '500'));
      }
    } on Exception catch (e) {
      if (e is AuthException) {
        response = DataFailure(Exception(
          "Unable to sign this user in : CODE 2",
        ));
        return response;
      } else if (e is SocketException) {
        response =
            DataFailure(Exception("Something was wrong with your internet"));
      }
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
