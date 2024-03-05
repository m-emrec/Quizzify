import '../../../../core/resources/data_state.dart';

abstract class OnboardingRepo {
  Future<DataState> setName(String name);
}
