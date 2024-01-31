import 'package:trivia/core/resources/data_state.dart';
import 'package:trivia/features/auth/data/datasources/auth_firebase_connection.dart';
import 'package:trivia/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthFirebaseConnection _firebaseConnection;

  AuthRepoImpl(this._firebaseConnection);
  @override
  Future<DataState> forgotPassword({required String email}) {
    throw UnimplementedError();
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
  Future<DataState> signInUserWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<DataState> signUpUserWithEmail(
      {required String email, required String password}) async {
    return await _firebaseConnection
        .createData({"email": email, "password": password});
  }
}
