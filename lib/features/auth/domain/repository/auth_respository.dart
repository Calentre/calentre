import 'package:calentre/core/resources.dart';

///Interface for all sign-in/up methods.
abstract class AuthRepository {
  //define a custom user response after signin
  Future<DataState<bool, Exception>> signInWithGoogle();

  Future<DataState> signInWithEmail();

  Future<DataState> signInWithSlack();

  Future<DataState> signInWithLinkedIn();
}
