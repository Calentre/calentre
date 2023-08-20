import 'package:equatable/equatable.dart';

abstract class AuthUserState extends Equatable {
  final Exception? exception;
  final bool? isSignedIn;

  const AuthUserState({this.exception, this.isSignedIn});

  @override
  List<Object> get props => [];
}

class UserSignInInitialState extends AuthUserState {
  const UserSignInInitialState();
}

class UserSignInLoading extends AuthUserState {
  const UserSignInLoading();
}

class UserSignInDone extends AuthUserState {
  const UserSignInDone(bool? user, bool isSignedIn)
      : super(isSignedIn: isSignedIn);
}

class UserSignInError extends AuthUserState {
  const UserSignInError(Exception exception, bool isSignedIn)
      : super(exception: exception, isSignedIn: isSignedIn);
}
