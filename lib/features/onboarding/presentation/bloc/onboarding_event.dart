part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class OnboardingSetNameEvent extends OnboardingEvent {
  final String name;

  const OnboardingSetNameEvent({required this.name});
}
