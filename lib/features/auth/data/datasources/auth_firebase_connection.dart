import 'package:firebase_auth/firebase_auth.dart';
import 'package:trivia/core/resources/data_state.dart';
import 'package:trivia/core/resources/firestore_connection.dart';
import 'package:trivia/logger.dart';

class AuthFirebaseConnection extends FireStoreConnection {
  @override
  Future<DataState> createData(Map? param) async {
    try {
      if (param != null) {
        await firebaseAuth.createUserWithEmailAndPassword(
          email: param["email"],
          password: param["password"],
        );
      } else {
        throw Exception("Unknown error occurred!").toString();
      }
      return DataSuccess("data");
    } on FirebaseAuthException catch (e) {
      return DataFailed(e.message);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState> deleteData(Map? param) {
    throw UnimplementedError();
  }

  @override
  Future<DataState> readData(Map? param) async {
    try {
      if (param != null) {
        await firebaseAuth.signInWithEmailAndPassword(
          email: param["email"],
          password: param["password"],
        );
      } else {
        throw Exception("Unknown error occurred!").toString();
      }
      return DataSuccess(null);
    } on FirebaseAuthException catch (e) {
      return DataFailed(e.code);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState> updateData(Map? param) {
    throw UnimplementedError();
  }
}
