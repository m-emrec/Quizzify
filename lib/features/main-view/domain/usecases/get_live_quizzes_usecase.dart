import 'package:trivia/core/resources/data_state.dart';
import 'package:trivia/core/resources/use_case.dart';
import 'package:trivia/features/main-view/domain/entities/live_quizzes_entity.dart';
import 'package:trivia/features/main-view/domain/repositories/home_repo.dart';

class GetLiveQuizzesInfoUseCase
    implements UseCase<DataState<LiveQuizzesEntity>, void> {
  final HomeRepo _homeRepo;

  GetLiveQuizzesInfoUseCase(this._homeRepo);
  @override
  Future<DataState<LiveQuizzesEntity>> call(void params) {
    return _homeRepo.getLiveQuizzes();
  }
}
