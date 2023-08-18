// ignore: avoid_web_libraries_in_flutter

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  AuthService(this.supabase);

  final SupabaseClient supabase;

  Future<bool> signInWithGoogle() async {
    final res = await supabase.auth.signInWithOAuth(
      Provider.google,
    );
    // final res = true;

    return res;
  }

//supabase signin with email

//Update user

//delete user
}
