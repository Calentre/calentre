import 'package:calentre/features/auth/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthUserState extends Equatable {
  final CalentreUser? user;
  final Exception? exception;
  final bool? isSignedIn;

  const AuthUserState({this.user, this.exception, this.isSignedIn});

  @override
  List<Object> get props => [user!, exception!];
}

class UserSignInInitialState extends AuthUserState {
  const UserSignInInitialState();
}

class UserSignInLoading extends AuthUserState {
  const UserSignInLoading();
}

class UserSignInDone extends AuthUserState {
  const UserSignInDone(CalentreUser user, bool isSignedIn)
      : super(user: user, isSignedIn: isSignedIn);
}

class UserSignInError extends AuthUserState {
  const UserSignInError(Exception exception, bool isSignedIn)
      : super(exception: exception, isSignedIn: isSignedIn);
}
