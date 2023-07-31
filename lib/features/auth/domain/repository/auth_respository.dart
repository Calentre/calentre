import 'package:calentre/core/resources.dart';
import 'package:firebase_auth/firebase_auth.dart';

///Interface for all sign-in/up methods.
abstract class AuthRepository {
  //define a custom user response after signin
  Future<DataState<UserCredential>> signInWithGoogle();

  Future<DataState> signInWithEmail();

  Future<DataState> signInWithSlack();

  Future<DataState> signInWithLinkedIn();
}
