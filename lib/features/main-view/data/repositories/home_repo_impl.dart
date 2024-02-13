import 'package:trivia/core/resources/data_state.dart';
import 'package:trivia/features/main-view/data/datasources/home_firebase_connection.dart';
import 'package:trivia/features/main-view/domain/repositories/home_repo.dart';

import '../models/app_bar_model.dart';
import '../models/friends_card_model.dart';
import '../models/live_quizzes_model.dart';
import '../models/recent_quiz_model.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeFirebaseConnection _firebaseConnection;

  HomeRepoImpl(this._firebaseConnection);
  @override
  DataState<AppBarModel> getAppBarInfo() {
    try {
      AppBarModel model = _firebaseConnection.getAppBarInfo();

      return DataSuccess(model);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<FriendsCardModel>> getFriendsInfo() async {
    try {
      List<FriendsCardModel> model =
          await _firebaseConnection.getFriendsInfoFromFirebase();
      return DataSuccess(model);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<List<LiveQuizzesModel>>> getLiveQuizzes() async {
    try {
      List<LiveQuizzesModel> model =
          await _firebaseConnection.getLiveQuizzesFromFirebase();
      return DataSuccess(model);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }

  @override
  Future<DataState<RecentQuizModel>> getRecentQuizInfo() async {
    try {
      RecentQuizModel model =
          await _firebaseConnection.getRecentQuizInfoFromFirebase();
      return DataSuccess(model);
    } catch (e) {
      return DataFailed(e.toString());
    }
  }
}
