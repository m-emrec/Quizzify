import 'package:get_it/get_it.dart';

import '../../../../core/constants/enums/injection_enums.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/repositories/home_repo.dart';
import '../datasources/home_firebase_connection.dart';
import '../models/app_bar_model.dart';
import '../models/friends_card_model.dart';
import '../models/live_quizzes_model.dart';
import '../models/recent_quiz_model.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeFirebaseConnection _firebaseConnection;
  final GetIt sl = GetIt.I;

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
      sl.registerSingleton<List<FriendsCardModel>>(model);
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
      sl.registerSingleton<List<LiveQuizzesModel>>(model,
          instanceName: InjectionEnum.listOfQuizzes.name);
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
