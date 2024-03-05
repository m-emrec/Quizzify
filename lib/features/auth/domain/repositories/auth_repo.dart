import '../../../../core/resources/data_state.dart';

abstract class AuthRepo {
  Future<DataState> signUpUserWithEmail({
    required String email,
    required String password,
  });
  Future<DataState> signInUserWithEmail({
    required String email,
    required String password,
  });

  Future<DataState> forgotPassword({
    required String email,
  });

  Future<DataState> signInUserWithGoogle();
  Future<DataState> signInUserWithFacebook();
}
