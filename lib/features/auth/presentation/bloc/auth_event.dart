part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthSignUpWithEmailEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthSignUpWithEmailEvent({
    required this.email,
    required this.password,
  });
}

class AuthSignInWithEmailEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthSignInWithEmailEvent({
    required this.email,
    required this.password,
  });
}
