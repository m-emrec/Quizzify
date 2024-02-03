// ignore_for_file: unnecessary_overrides

import 'package:firebase_auth/firebase_auth.dart';
import 'package:trivia/core/constants/enums/firestore_enums.dart';
import 'package:trivia/core/constants/strings.dart';
import 'package:trivia/core/resources/data_state.dart';
import 'package:trivia/core/resources/firestore_connection.dart';

class OnboardingFirestoreConnection extends FireStoreConnection {
  @override
  String? get uid => super.uid;

  /// Update user's display name
  @override
  Future<DataState> createData(Map? param) async {
    try {
      if (param != null) {
        final User? user = firebaseAuth.currentUser;
        final String name = param["name"];

        /// update display name
        user?.updateDisplayName(name);

        firestore.collection(FireStoreEnum.Users.name).doc(uid).set({});
        return DataSuccess(null);
      } else {
        throw Exception(AppStrings().unknownErrorText).toString();
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
