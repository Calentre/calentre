import 'package:calentre/features/auth/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  final CalentreUser? user;
  final Exception? exception;

  const AuthState({this.user, this.exception});

  @override
  List<Object> get props => [user!, exception!];
}

class UserSignInLoading extends AuthState {
  const UserSignInLoading();
}

class UserSignInDone extends AuthState {
  const UserSignInDone(CalentreUser user) : super(user: user);
}

class UserSignInError extends AuthState {
  const UserSignInError(Exception exception) : super(exception: exception);
}
