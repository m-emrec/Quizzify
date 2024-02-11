import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trivia/core/constants/enums/firestore_enums.dart';
import 'package:trivia/core/resources/data_state.dart';

abstract class FireStoreConnection {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => firebaseAuth.currentUser;
  String? get uid => firebaseAuth.currentUser?.uid;

  /// This function returns given collection
  Future<CollectionReference<Map<String, dynamic>>> getCollection(
      String collectionName) async {
    return firestore.collection(collectionName);
  }

  /// This function return the given user's document.
  Future<DocumentReference<Map<String, dynamic>>> getUserDoc(
      String? uid) async {
    final CollectionReference<Map<String, dynamic>> collection =
        await getCollection(CollectionEnum.Users.name);
    final DocumentReference<Map<String, dynamic>> userDoc = collection.doc(uid);
    return userDoc;
  }

  /// This function returns QuizzesCollection for given category
  Future<CollectionReference<Map<String, dynamic>>> getQuizzesCollection(
      {required String category}) async {
    CollectionReference<Map<String, dynamic>> categoryCollection =
        await getCollection(CollectionEnum.Categories.name);

    DocumentReference<Map<String, dynamic>> categoryDoc =
        categoryCollection.doc(category);
    CollectionReference<Map<String, dynamic>> quizzesCollection =
        categoryDoc.collection(CollectionEnum.Quizzes.name);
    return quizzesCollection;
  }

  CollectionReference<Map<String, dynamic>> getQuestions(
      CollectionReference<Map<String, dynamic>> quizzesCollection, String qid) {
    CollectionReference<Map<String, dynamic>> questionsCollection =
        quizzesCollection.doc(qid).collection(CollectionEnum.Questions.name);
    ;
    return questionsCollection;
  }

  Future<DataState> readData(Map? param) {
    throw UnimplementedError();
  }

  Future<DataState> deleteData(Map? param) {
    throw UnimplementedError();
  }

  Future<DataState> updateData(Map? param) {
    throw UnimplementedError();
  }

  Future<DataState> createData(Map? param) {
    throw UnimplementedError();
  }
}
