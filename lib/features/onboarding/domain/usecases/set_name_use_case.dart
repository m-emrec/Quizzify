import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/use_case.dart';
import '../repositories/onboarding_repo.dart';

class SetNameUseCase implements UseCase<DataState, String> {
  final OnboardingRepo _onboardingRepo;
  SetNameUseCase(this._onboardingRepo);

  @override
  Future<DataState> call(String params) {
    return _onboardingRepo.setName(params);
  }
}
