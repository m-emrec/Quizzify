import 'package:trivia/core/resources/data_state.dart';
import 'package:trivia/core/resources/use_case.dart';
import 'package:trivia/features/main-view/domain/entities/friends_card_entity.dart';
import 'package:trivia/features/main-view/domain/repositories/home_repo.dart';

class GetFriendsInfoUseCase
    implements UseCase<DataState<FriendsCardEntity>, void> {
  final HomeRepo _homeRepo;

  GetFriendsInfoUseCase(this._homeRepo);

  @override
  Future<DataState<FriendsCardEntity>> call(void params) async {
    return _homeRepo.getFriendsInfo();
  }
}
