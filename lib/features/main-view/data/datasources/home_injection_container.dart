import 'package:trivia/core/resources/injection_container.dart';
import 'package:trivia/features/main-view/data/datasources/home_firebase_connection.dart';
import 'package:trivia/features/main-view/data/repositories/home_repo_impl.dart';
import 'package:trivia/features/main-view/domain/repositories/home_repo.dart';
import 'package:trivia/features/main-view/domain/usecases/get_app_bar_info_usecase.dart';
import 'package:trivia/features/main-view/domain/usecases/get_friends_info_usecase.dart';
import 'package:trivia/features/main-view/domain/usecases/get_live_quizzes_usecase.dart';
import 'package:trivia/features/main-view/domain/usecases/get_recent_quiz_info_usecase.dart';
import 'package:trivia/features/main-view/presentation/bloc/main_view_bloc.dart';

class HomeInjectionContainer extends InjectionContainer {
  @override
  Future<void> dispose() async {
    /// firebase connection
    unRegister<HomeFirebaseConnection>(HomeFirebaseConnection());

    /// repo
    unRegister<HomeRepo>(HomeRepoImpl(sl()));

    unRegister<GetAppBarInfoUseCase>(GetAppBarInfoUseCase(sl()));
    unRegister<GetFriendsInfoUseCase>(GetFriendsInfoUseCase(sl()));
    unRegister<GetLiveQuizzesInfoUseCase>(GetLiveQuizzesInfoUseCase(sl()));
    unRegister<GetRecentQuizInfoUseCase>(GetRecentQuizInfoUseCase(sl()));

    /// Bloc
    unRegister(MainViewBloc(
      sl(),
      sl(),
      sl(),
      sl(),
    ));
  }

  @override
  Future<void> initialize() async {
    sl.allowReassignment = true;

    /// firebase connection
    register<HomeFirebaseConnection>(HomeFirebaseConnection());

    /// repo
    register<HomeRepo>(HomeRepoImpl(sl()));

    register<GetAppBarInfoUseCase>(GetAppBarInfoUseCase(sl()));
    register<GetFriendsInfoUseCase>(GetFriendsInfoUseCase(sl()));
    register<GetLiveQuizzesInfoUseCase>(GetLiveQuizzesInfoUseCase(sl()));
    register<GetRecentQuizInfoUseCase>(GetRecentQuizInfoUseCase(sl()));

    /// Bloc
    sl.registerFactory<MainViewBloc>(
      () => MainViewBloc(
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
  }
}
