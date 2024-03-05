import '../../../../core/resources/injection_container.dart';
import '../../domain/repositories/onboarding_repo.dart';
import '../../domain/usecases/set_name_use_case.dart';
import '../../presentation/bloc/onboarding_bloc.dart';
import '../repositories/onboarding_repo_impl.dart';
import 'onboarding_firestore_connection.dart';

class OnboardingInjectionContainer extends InjectionContainer {
  @override
  Future<void> initialize() async {
    register<OnboardingFirestoreConnection>(OnboardingFirestoreConnection());

    register<OnboardingRepo>(OnboardingRepoImpl(firestoreConnection: sl()));
    register<SetNameUseCase>(SetNameUseCase(sl()));
    register<OnboardingBloc>(OnboardingBloc(sl()));
  }

  @override
  Future<void> dispose() async {
    unRegister<OnboardingFirestoreConnection>(OnboardingFirestoreConnection);
    unRegister<OnboardingRepo>(OnboardingRepo);
    unRegister<SetNameUseCase>(SetNameUseCase);
    unRegister<OnboardingBloc>(OnboardingBloc);
  }
}
