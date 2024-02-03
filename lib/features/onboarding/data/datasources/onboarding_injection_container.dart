import 'package:trivia/core/resources/injection_container.dart';
import 'package:trivia/features/onboarding/data/datasources/onboarding_firestore_connection.dart';
import 'package:trivia/features/onboarding/domain/repositories/onboarding_repo.dart';

import '../../domain/usecases/set_name_use_case.dart';
import '../../presentation/bloc/onboarding_bloc.dart';
import '../repositories/onboarding_repo_impl.dart';

class OnboardingInjectionContainer extends InjectionContainer {
  @override
  Future<void> initialize() async {
    sl.registerSingleton<OnboardingFirestoreConnection>(
        OnboardingFirestoreConnection());
    sl.registerSingleton<OnboardingRepo>(
        OnboardingRepoImpl(firestoreConnection: sl()));
    sl.registerSingleton<SetNameUseCase>(SetNameUseCase(sl()));
    sl.registerSingleton<OnboardingBloc>(OnboardingBloc(sl()));
  }
}
