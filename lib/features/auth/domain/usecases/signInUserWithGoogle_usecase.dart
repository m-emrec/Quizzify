import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/use_case.dart';
import '../repositories/auth_repo.dart';

class SignInUserWithGoogleUsecase extends UseCase<DataState, void> {
  final AuthRepo _authRepo;

  SignInUserWithGoogleUsecase(this._authRepo);
  @override
  Future<DataState> call(void params) {
    return _authRepo.signInUserWithGoogle();
  }
}
