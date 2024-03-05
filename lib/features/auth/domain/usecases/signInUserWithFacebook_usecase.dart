import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/use_case.dart';
import '../repositories/auth_repo.dart';

class SignInUserWithFacebook extends UseCase<DataState, void> {
  final AuthRepo _authRepo;

  SignInUserWithFacebook(this._authRepo);
  @override
  Future<DataState> call(void params) {
    return _authRepo.signInUserWithFacebook();
  }
}
