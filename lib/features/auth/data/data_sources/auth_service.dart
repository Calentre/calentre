// ignore: avoid_web_libraries_in_flutter

import 'package:calentre/config/constants/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  AuthService(this._remoteURLs);

  final RemoteURLs _remoteURLs;
  final SupabaseClient supabase = Supabase.instance.client;

  Future<bool> signInWithGoogle() async {
    final res = await supabase.auth.signInWithOAuth(Provider.google,
        authScreenLaunchMode: LaunchMode.externalApplication);
    // final res = true;

    return res;
  }

//supabase signin with email

//Update user

//delete user
}
