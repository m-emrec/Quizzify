import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trivia/features/main-view/data/models/friends_card_model.dart';
import 'package:trivia/features/main-view/data/models/live_quizzes_model.dart';
import 'package:trivia/features/main-view/data/models/recent_quiz_model.dart';
import 'package:trivia/features/main-view/domain/usecases/get_app_bar_info_usecase.dart';
import 'package:trivia/features/main-view/domain/usecases/get_friends_info_usecase.dart';
import 'package:trivia/features/main-view/domain/usecases/get_live_quizzes_usecase.dart';
import 'package:trivia/features/main-view/domain/usecases/get_recent_quiz_info_usecase.dart';

import '../../data/models/app_bar_model.dart';

part 'main_view_event.dart';
part 'main_view_state.dart';

class MainViewBloc extends Bloc<MainViewEvent, MainViewState> {
  final GetAppBarInfoUseCase _getAppBarInfoUseCase;
  final GetFriendsInfoUseCase _getFriendsInfoUseCase;
  final GetLiveQuizzesInfoUseCase _getLiveQuizzesInfoUseCase;
  final GetRecentQuizInfoUseCase _getRecentQuizInfoUseCase;

  MainViewBloc(this._getAppBarInfoUseCase, this._getFriendsInfoUseCase,
      this._getLiveQuizzesInfoUseCase, this._getRecentQuizInfoUseCase)
      : super(MainViewInitial()) {
    on<GetAppBarInfoEvent>(onGetAppBarInfoEvent);
    on<GetLiveQuizzesEvent>(onGetLiveQuizzesEvent);
    on<GetFriendsInfoEvent>(onGetFriendsInfoEvent);
    on<GetRecentQuizzesEvent>(onGetRecentQuizzesEvent);
  }

  FutureOr<void> onGetAppBarInfoEvent(
      GetAppBarInfoEvent event, Emitter<MainViewState> emit) async {
    // logger.d("GetAppBar");
    emit(MainViewLoadingState());
    await Future.delayed(
      Duration(seconds: 3),
    ).then((_) => emit(MainViewSuccessState(AppBarModel())));
  }

  FutureOr<void> onGetLiveQuizzesEvent(
      GetLiveQuizzesEvent event, Emitter<MainViewState> emit) async {
    // logger.d("GetLiveQuizzes");
    emit(MainViewLoadingState());
    await Future.delayed(
      Duration(seconds: 8),
    ).then((_) => emit(MainViewSuccessState(LiveQuizzesModel())));
  }

  FutureOr<void> onGetFriendsInfoEvent(
      GetFriendsInfoEvent event, Emitter<MainViewState> emit) async {
    // logger.d("GetFriendsCard");
    emit(MainViewLoadingState());
    await Future.delayed(
      Duration(seconds: 1),
    ).then((_) => emit(MainViewSuccessState(FriendsCardModel())));
  }

  FutureOr<void> onGetRecentQuizzesEvent(
      GetRecentQuizzesEvent event, Emitter<MainViewState> emit) async {
    // logger.d("GetRecentQuiz");
    emit(MainViewLoadingState());
    await Future.delayed(
      Duration(seconds: 10),
    ).then((_) => emit(MainViewSuccessState(RecentQuizModel())));
  }
}
