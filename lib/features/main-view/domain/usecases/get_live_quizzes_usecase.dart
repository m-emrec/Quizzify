import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/use_case.dart';
import '../entities/live_quizzes_entity.dart';
import '../repositories/home_repo.dart';

class GetLiveQuizzesInfoUseCase
    implements UseCase<DataState<List<LiveQuizzesEntity>>, void> {
  final HomeRepo _homeRepo;

  GetLiveQuizzesInfoUseCase(this._homeRepo);
  @override
  Future<DataState<List<LiveQuizzesEntity>>> call(void params) {
    return _homeRepo.getLiveQuizzes();
  }
}
