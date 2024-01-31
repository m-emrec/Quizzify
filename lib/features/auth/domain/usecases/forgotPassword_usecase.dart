import 'package:trivia/core/resources/data_state.dart';
import 'package:trivia/core/resources/use_case.dart';
import 'package:trivia/features/auth/domain/repositories/auth_repo.dart';

class ForgotPasswordUsecase extends UseCase<DataState, String> {
  final AuthRepo _authRepo;

  ForgotPasswordUsecase(this._authRepo);
  @override
  Future<DataState> call(String params) {
    return _authRepo.forgotPassword(email: params);
  }
}
