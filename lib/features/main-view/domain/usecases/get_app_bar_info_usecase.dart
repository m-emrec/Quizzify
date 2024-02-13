import 'package:trivia/core/resources/data_state.dart';
import 'package:trivia/core/resources/use_case.dart';
import 'package:trivia/features/main-view/domain/repositories/home_repo.dart';

import '../entities/app_bar_entitiy.dart';

class GetAppBarInfoUseCase implements UseCase<DataState<AppBarEntity>, void> {
  final HomeRepo _homeRepo;

  GetAppBarInfoUseCase(this._homeRepo);
  @override
  Future<DataState<AppBarEntity>> call(void param) async {
    return _homeRepo.getAppBarInfo();
  }
}
