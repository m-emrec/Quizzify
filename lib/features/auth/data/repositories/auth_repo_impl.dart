import '../../../../core/resources/data_state.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasources/auth_firebase_connection.dart';
import '../datasources/google_sign_in_connection.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthFirebaseConnection _firebaseConnection;

  AuthRepoImpl(this._firebaseConnection);
  @override
  Future<DataState> forgotPassword({required String email}) async {
    return await _firebaseConnection.forgotPassword(email);
  }

  @override
  Future<DataState> signInUserWithEmail(
      {required String email, required String password}) async {
    return _firebaseConnection.readData(
      {
        "email": email,
        "password": password,
      },
    );
  }

  @override
  Future<DataState> signInUserWithFacebook() {
    throw UnimplementedError();
  }

  @override
  Future<DataState> signInUserWithGoogle() async {
    final credential = await GoogleSignInService().signIn();

    if (credential is DataSuccess) {
      return await _firebaseConnection.signInWithGoogle(credential.data);
    }
    return DataFailed(credential.exception);
  }

  @override
  Future<DataState> signUpUserWithEmail(
      {required String email, required String password}) async {
    return await _firebaseConnection
        .createData({"email": email, "password": password});
  }
}
