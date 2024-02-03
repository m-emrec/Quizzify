import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trivia/core/constants/enums/firestore_enums.dart';
import 'package:trivia/core/resources/data_state.dart';

abstract class FireStoreConnection {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String? get uid => firebaseAuth.currentUser?.uid;

  /// This function returns Users collection
  Future<CollectionReference<Map<String, dynamic>>> getUsersCollection() async {
    return firestore.collection(FireStoreEnum.Users.name);
  }

  /// This function return the given user's document.
  Future<DocumentReference<Map<String, dynamic>>> getUserDoc(
      String? uid) async {
    final CollectionReference<Map<String, dynamic>> collection =
        await getUsersCollection();
    final DocumentReference<Map<String, dynamic>> userDoc = collection.doc(uid);
    return userDoc;
  }

  Future<DataState> readData(Map? param);
  Future<DataState> deleteData(Map? param);
  Future<DataState> updateData(Map? param);
  Future<DataState> createData(Map? param);
}
