part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

abstract class AuthActionState extends AuthState {}

class AuthLoadingState extends AuthActionState {}

class AuthSuccessState extends AuthActionState {
  final String? successMessage;
  final void Function(dynamic val)? afterSuccess;

  AuthSuccessState({
    this.successMessage,
    this.afterSuccess,
  });
}

class AuthFailedState extends AuthActionState {
  final String exception;
  AuthFailedState(this.exception);
}
