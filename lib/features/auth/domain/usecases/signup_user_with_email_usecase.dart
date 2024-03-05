import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/use_case.dart';
import '../repositories/auth_repo.dart';

class SignUpUserWithEmailUsecase extends UseCase<DataState, Map> {
  final AuthRepo _authRepo;

  SignUpUserWithEmailUsecase(this._authRepo);

  @override
  Future<DataState> call(Map params) {
    return _authRepo.signUpUserWithEmail(
        email: params["email"], password: params["password"]);
  }
}
