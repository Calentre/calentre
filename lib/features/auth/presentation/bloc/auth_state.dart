import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class IsSignedInInitialState extends AuthState {
  IsSignedInInitialState({required this.isSignedIn});

  final bool isSignedIn;

  @override
  List<Object?> get props => [isSignedIn];
}

class UpdatedSignedInState extends AuthState {
  UpdatedSignedInState({required this.isSignedIn});

  final bool isSignedIn;

  @override
  List<Object?> get props => [isSignedIn];
}
