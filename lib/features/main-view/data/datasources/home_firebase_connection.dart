import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trivia/core/constants/enums/firestore_enums.dart';
import 'package:trivia/core/resources/firestore_connection.dart';
import 'package:trivia/features/main-view/data/models/app_bar_model.dart';
import 'package:trivia/features/main-view/data/models/friends_card_model.dart';
import 'package:trivia/features/main-view/data/models/live_quizzes_model.dart';
import 'package:trivia/features/main-view/data/models/recent_quiz_model.dart';

class HomeFirebaseConnection extends FireStoreConnection {
  AppBarModel getAppBarInfo() {
    User? user = currentUser;

    AppBarModel model = AppBarModel.fromFirebase(user);
    return model;
  }

  Future<List<FriendsCardModel>> getFriendsInfoFromFirebase() async {
    DocumentSnapshot userDoc = await getUserDoc(uid).then((doc) => doc.get());
    List<FriendsCardModel> listOfFriends = [];

    for (var userId in userDoc[UserEnum.friends]) {
      DocumentSnapshot? friendDoc =
          await getUserDoc(userId).then((doc) => doc.get());
      listOfFriends.add(
        FriendsCardModel.fromFirebase(friendDoc),
      );
    }
    return listOfFriends;
  }

  String returnRandomCategory() {
    int randomIndex = Random().nextInt(Categories.values.length);
    String randomCategory = Categories.values[randomIndex].name;
    return randomCategory;
  }

  Future<List<LiveQuizzesModel>> getLiveQuizzesFromFirebase() async {
    List<LiveQuizzesModel> listOfQuizzes = [];
    for (var i = 0; i < 10; i++) {
      // choose random category
      String category = returnRandomCategory();
      // get quizzes collection for chosen category
      CollectionReference<Map<String, dynamic>> quizzesCollection =
          await getQuizzesCollection(category: category);
      // first order quizzesCollection by createdDate , then return the documents.
      QuerySnapshot<Map<String, dynamic>> quizCollectionData =
          await quizzesCollection.orderBy(QuizEnum.createdDate.name).get();

      /// select the first Document from quizzesCollection.
      /// this document is the last created document in the collection
      QueryDocumentSnapshot<Map<String, dynamic>> quizDoc =
          quizCollectionData.docs.first;

      /// Get the data of the document
      Map<String, dynamic> quizDocData = quizDoc.data();

      /// get questions collection and return number of questions
      int numberOfQuestions = await getQuestions(quizzesCollection, quizDoc.id)
          .get()
          .then((value) => value.docs.length);

      /// Number of questions and category is not exist inside [quizDocData]
      /// I put them here
      quizDocData
        ..putIfAbsent(QuizEnum.category.name, () => category)
        ..putIfAbsent(QuizEnum.numberOfQuestions.name, () => numberOfQuestions);

      LiveQuizzesModel model = LiveQuizzesModel.fromFirebase(quizDocData);
      listOfQuizzes.add(model);
    }
    return listOfQuizzes;
  }

  Future<RecentQuizModel> getRecentQuizInfoFromFirebase() async {
    DocumentReference<Map<String, dynamic>> userDoc = await getUserDoc(uid);

    Query<Map<String, dynamic>> playedQuizzesCollection = userDoc
        .collection(CollectionEnum.PlayedQuizzes.name)
        .orderBy(PlayedQuizEnum.lastPlayedDate.name);
    QueryDocumentSnapshot<Map<String, dynamic>> recentPlayedQuiz =
        await playedQuizzesCollection.get().then((value) => value.docs.first);

    Map<String, dynamic> recentPlayedQuizData = recentPlayedQuiz.data();
    return RecentQuizModel.fromFactory(recentPlayedQuizData);
  }
}
