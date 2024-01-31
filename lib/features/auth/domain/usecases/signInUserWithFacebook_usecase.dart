import 'package:trivia/core/resources/data_state.dart';
import 'package:trivia/core/resources/use_case.dart';
import 'package:trivia/features/auth/domain/repositories/auth_repo.dart';

class SignInUserWithFacebook extends UseCase<DataState, void> {
  final AuthRepo _authRepo;

  SignInUserWithFacebook(this._authRepo);
  @override
  Future<DataState> call(void params) {
    return _authRepo.signInUserWithFacebook();
  }
}
