import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constants/enums/firestore_enums.dart';
import '../shared/models/quiz_model.dart';
import 'data_state.dart';

abstract class FireStoreConnection {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => firebaseAuth.currentUser;

  /// UID of current user
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

  /// This function gives all of the quizzes in Firestore
  Future<List<QuizModel>> getAllQuizzes() async {
    List<QuizModel> listOfAllQuizzes = [];

    /// get categoryCollection
    CollectionReference<Map<String, dynamic>> categoryCollection =
        await getCollection(CollectionEnum.Categories.name);

    /// get documents from collection
    QuerySnapshot<Map<String, dynamic>> docsOfCategoryCollection =
        await categoryCollection.get();

    /// get List of document data
    List<QueryDocumentSnapshot<Map<String, dynamic>>> listOfCategories =
        docsOfCategoryCollection.docs;

    for (var category in listOfCategories) {
      String categoryName = category.id;

      /// here get the quizCollection for given category
      CollectionReference<Map<String, dynamic>> quizCollectionByCategory =
          await getQuizzesCollection(category: categoryName);

      /// get docs of quizCollection
      QuerySnapshot<Map<String, dynamic>> docsOfQuizzes =
          await quizCollectionByCategory.get();

      /// get List of quiz documents data
      List<QueryDocumentSnapshot<Map<String, dynamic>>>
          listOfQuizzesByCategory = docsOfQuizzes.docs;

      /// inside the list of quizzes
      for (var quiz in listOfQuizzesByCategory) {
        /// get Quiz dat
        Map<String, dynamic> quizData = quiz.data();

        /// Get number of questions
        int numberOfQuestions = await getNumberOfQuestions(
            quizCollectionByCategory, quizData[QuizEnum.qid.name]);

        /// Category name and number of questions are not exits in quizData
        /// so I add them here
        quizData.putIfAbsent(QuizEnum.category.name, () => categoryName);
        quizData.putIfAbsent(
            QuizEnum.numberOfQuestions.name, () => numberOfQuestions);

        /// create QuizModel and add it to listOfAllQuizzes
        QuizModel model = QuizModel.fromFirebase(quizData);
        listOfAllQuizzes.add(model);
      }
    }

    /// Sort quizzes by their createdDate
    listOfAllQuizzes.sort((a, b) {
      return a.createdDate.compareTo(b.createdDate);
    });
    listOfAllQuizzes = listOfAllQuizzes.reversed.toList(); //
    return listOfAllQuizzes;
  }

  Future<int> getNumberOfQuestions(
      CollectionReference<Map<String, dynamic>> quizzesCollection,
      String qid) async {
    /// get the questions of the quiz
    CollectionReference<Map<String, dynamic>> questionsOfQuiz =
        getQuestions(quizzesCollection, qid);

    /// Get number of questions
    int numberOfQuestions =
        await questionsOfQuiz.get().then((value) => value.docs.length);
    return numberOfQuestions;
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
