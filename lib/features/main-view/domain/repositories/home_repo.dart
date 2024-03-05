import '../../../../core/resources/data_state.dart';
import '../entities/app_bar_entitiy.dart';
import '../entities/friends_card_entity.dart';
import '../entities/live_quizzes_entity.dart';
import '../entities/recent_quiz_entity.dart';

abstract class HomeRepo {
  DataState<AppBarEntity> getAppBarInfo();

  Future<DataState<RecentQuizEntity>> getRecentQuizInfo();

  Future<DataState<FriendsCardEntity>> getFriendsInfo();

  Future<DataState<List<LiveQuizzesEntity>>> getLiveQuizzes();
}
