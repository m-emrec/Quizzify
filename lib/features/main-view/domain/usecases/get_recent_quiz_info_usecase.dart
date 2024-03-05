import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/use_case.dart';
import '../entities/recent_quiz_entity.dart';
import '../repositories/home_repo.dart';

class GetRecentQuizInfoUseCase
    implements UseCase<DataState<RecentQuizEntity>, void> {
  final HomeRepo _homeRepo;

  GetRecentQuizInfoUseCase(this._homeRepo);

  @override
  Future<DataState<RecentQuizEntity>> call(void params) async {
    return _homeRepo.getRecentQuizInfo();
  }
}
