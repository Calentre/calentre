import 'package:calentre/core/resources.dart';
import 'package:calentre/features/auth/data/models/user_model.dart';

///Interface for all sign-in/up methods.
abstract class AuthRepository {
  //define a custom user response after signin
  Future<DataState<CalentreUser>> signInWithGoogle();

  Future<DataState> signInWithEmail();

  Future<DataState> signInWithSlack();

  Future<DataState> signInWithLinkedIn();
}
