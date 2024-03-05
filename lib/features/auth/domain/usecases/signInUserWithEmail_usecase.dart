import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/use_case.dart';
import '../repositories/auth_repo.dart';

class SignInWithEmailUsecase extends UseCase<DataState, Map> {
  final AuthRepo _authRepo;

  SignInWithEmailUsecase(this._authRepo);
  @override
  Future<DataState> call(Map params) {
    return _authRepo.signInUserWithEmail(
        email: params["email"], password: params["password"]);
  }
}
