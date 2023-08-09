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
    final res = await supabase.auth.signInWithOAuth(
      Provider.google,
    );

    final supabaseCurrentUser = supabase.auth.currentUser;

    if (supabaseCurrentUser != null && res) {
      _calentreUser = CalentreUser(
          userId: supabaseCurrentUser.id,
          name: supabaseCurrentUser.userMetadata!["full_name"],
          email: supabaseCurrentUser.email ?? "",
          avatarUrl: supabaseCurrentUser.userMetadata!["avatar_url"]);
    }

    //map response to Calentre User

    return _calentreUser;
  }

//supabase signin with email

//Update user

//delete user
}
