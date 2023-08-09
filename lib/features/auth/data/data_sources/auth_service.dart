// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:calentre/config/constants/constants.dart';
import 'package:calentre/core/DTOs/user_dto.dart';
import 'package:calentre/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  AuthService(this._dio, this._userDTO, this._remoteURLs);

  final Dio _dio;
  final UserDTO _userDTO;
  final RemoteURLs _remoteURLs;
  CalentreUser? _calentreUser;
  final supabase = Supabase.instance.client;

  Future<CalentreUser?> signInWithGoogle() async {
    final res = await Supabase.instance.client.auth.signInWithOAuth(
      Provider.google,
    );

    //map response to Calentre User

    return _calentreUser;
  }

  Future<void> signInWithEmail() async {
// if(_calentreUser != null) {
//       final AuthResponse res = await supabase.auth.si(
//           email: _calentreUser!.email,);
// }
  }

//supabase signin with email

//Update user

//delete user
}
