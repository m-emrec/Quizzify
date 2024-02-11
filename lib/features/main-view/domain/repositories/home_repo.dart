import 'package:trivia/core/resources/data_state.dart';
import 'package:trivia/features/main-view/domain/entities/app_bar_entitiy.dart';
import 'package:trivia/features/main-view/domain/entities/friends_card_entity.dart';
import 'package:trivia/features/main-view/domain/entities/live_quizzes_entity.dart';
import 'package:trivia/features/main-view/domain/entities/recent_quiz_entity.dart';

abstract class HomeRepo {
  DataState<AppBarEntity> getAppBarInfo();

  Future<DataState<RecentQuizEntity>> getRecentQuizInfo();

  Future<DataState<FriendsCardEntity>> getFriendsInfo();

  Future<DataState<LiveQuizzesEntity>> getLiveQuizzes();
}
