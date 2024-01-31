part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthSignUpWithEmail extends AuthEvent {
  final String email;
  final String password;

  const AuthSignUpWithEmail({
    required this.email,
    required this.password,
  });
}
