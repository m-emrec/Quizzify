import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/constants/enums/firestore_enums.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/firestore_connection.dart';

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
        final CollectionReference<Map<String, dynamic>> collection =
            await getCollection(CollectionEnum.Users.name);

        /// create user doc
        collection.doc(uid).set({});
        return DataSuccess(null);
      } else {
        throw Exception(AppStrings().unknownErrorText).toString();
      }
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
