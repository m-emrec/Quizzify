import 'package:trivia/core/resources/data_state.dart';
import 'package:trivia/core/resources/use_case.dart';
import 'package:trivia/features/main-view/domain/repositories/home_repo.dart';

import '../entities/recent_quiz_entity.dart';

class GetRecentQuizInfoUseCase
    implements UseCase<DataState<RecentQuizEntity>, void> {
  final HomeRepo _homeRepo;

  GetRecentQuizInfoUseCase(this._homeRepo);

  @override
  Future<DataState<RecentQuizEntity>> call(void params) async {
    return _homeRepo.getRecentQuizInfo();
  }
}
