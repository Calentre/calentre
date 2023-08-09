import 'package:calentre/core/resources.dart';
import 'package:calentre/features/auth/data/models/user_model.dart';
import 'package:calentre/features/auth/domain/repository/auth_respository.dart';

class AuthRepositoryImpl implements AuthRepository {
  // AuthRepositoryImpl(this.);
  @override
  Future<DataState> signInWithEmail() {
    throw UnimplementedError();
  }

  @override
  Future<DataState<CalentreUser>> signInWithGoogle() {
    //Get useremail

    //if user !exist, we signup user w/ POST data
    //return user Data
    throw UnimplementedError();
  }

  @override
  Future<DataState> signInWithLinkedIn() {
    // TODO: implement signInWithLinkedIn
    throw UnimplementedError();
  }

  @override
  Future<DataState> signInWithSlack() {
    // TODO: implement signInWithSlack
    throw UnimplementedError();
  }
}
