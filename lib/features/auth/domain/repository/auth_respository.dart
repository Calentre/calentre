import 'package:calentre/core/resources.dart';

///Interface for all sign-in/up methods.
abstract class AuthRepository {
  Future<DataState> signInWithGoogle();

  Future<DataState> signInWithEmail();

  Future<DataState> signInWithSlack();

  Future<DataState> signInWithLinkedIn();
}
