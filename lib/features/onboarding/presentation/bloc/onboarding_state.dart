part of 'onboarding_bloc.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

class OnboardingInitial extends OnboardingState {}

abstract class OnboardingActionState extends OnboardingState {}

class OnboardingSuccessState extends OnboardingActionState {
  final String? successMessage;

  /// If there will be some task to execute after a successful task use this param.
  final void Function(dynamic val)? afterSuccess;

  OnboardingSuccessState({this.successMessage, this.afterSuccess});
}

class OnboardingFailedState extends OnboardingActionState {
  final String? exception;

  OnboardingFailedState({this.exception});
}
