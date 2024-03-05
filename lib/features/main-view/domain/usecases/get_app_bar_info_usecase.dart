import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/use_case.dart';
import '../entities/app_bar_entitiy.dart';
import '../repositories/home_repo.dart';

class GetAppBarInfoUseCase implements UseCase<DataState<AppBarEntity>, void> {
  final HomeRepo _homeRepo;

  GetAppBarInfoUseCase(this._homeRepo);
  @override
  Future<DataState<AppBarEntity>> call(void param) async {
    return _homeRepo.getAppBarInfo();
  }
}
