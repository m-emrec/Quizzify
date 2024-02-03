import 'package:trivia/core/resources/data_state.dart';
import 'package:trivia/core/resources/use_case.dart';
import 'package:trivia/features/onboarding/domain/repositories/onboarding_repo.dart';

class SetNameUseCase implements UseCase<DataState, String> {
  final OnboardingRepo _onboardingRepo;
  SetNameUseCase(this._onboardingRepo);

  @override
  Future<DataState> call(String params) {
    return _onboardingRepo.setName(params);
  }
}
