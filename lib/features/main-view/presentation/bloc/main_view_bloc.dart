import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trivia/core/constants/error_texts.dart';
import 'package:trivia/core/resources/data_state.dart';
import 'package:trivia/core/resources/use_case.dart';
import 'package:trivia/features/main-view/data/models/friends_card_model.dart';
import 'package:trivia/features/main-view/data/models/live_quizzes_model.dart';
import 'package:trivia/features/main-view/data/models/recent_quiz_model.dart';
import 'package:trivia/features/main-view/domain/usecases/get_app_bar_info_usecase.dart';
import 'package:trivia/features/main-view/domain/usecases/get_friends_info_usecase.dart';
import 'package:trivia/features/main-view/domain/usecases/get_live_quizzes_usecase.dart';
import 'package:trivia/features/main-view/domain/usecases/get_recent_quiz_info_usecase.dart';
import 'package:trivia/logger.dart';

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
  final AppErrorText _appErrorText = AppErrorText();

  Future<void> _emitStateFunc<T>({
    required UseCase useCase,
    required Emitter<MainViewState> emit,
  }) async {
    final DataState dataState = await useCase(null);
    if (dataState.runtimeType == DataSuccess<T>) {
      emit(MainViewSuccessState<T>(dataState.data));
    } else if (dataState.runtimeType == DataFailed) {
      logger.e(dataState.exception);
      emit(
          MainViewFailedState(_appErrorText.errorMessage(dataState.exception)));
    }
  }

  FutureOr<void> onGetAppBarInfoEvent(
      GetAppBarInfoEvent event, Emitter<MainViewState> emit) async {
    emit(MainViewLoadingState());

    await _emitStateFunc<AppBarModel>(
        useCase: _getAppBarInfoUseCase, emit: emit);
  }

  FutureOr<void> onGetLiveQuizzesEvent(
      GetLiveQuizzesEvent event, Emitter<MainViewState> emit) async {
    emit(MainViewLoadingState());

    await _emitStateFunc<List<LiveQuizzesModel>>(
        useCase: _getLiveQuizzesInfoUseCase, emit: emit);
  }

  /// TODO : Implement this after [Discover] feature done.
  FutureOr<void> onGetFriendsInfoEvent(
      GetFriendsInfoEvent event, Emitter<MainViewState> emit) async {
    emit(MainViewLoadingState());
    await Future.delayed(
      Duration(seconds: 1),
    ).then((_) => emit(MainViewSuccessState(FriendsCardModel())));
  }

  /// TODO : Implement this after [PlayQuiz] feature done
  FutureOr<void> onGetRecentQuizzesEvent(
      GetRecentQuizzesEvent event, Emitter<MainViewState> emit) async {
    emit(MainViewLoadingState());
    await Future.delayed(
      Duration(milliseconds: 300),
    ).then((_) => emit(MainViewSuccessState(RecentQuizModel())));

    //  emit(MainViewLoadingState());
    // final DataState dataState = await _getRecentQuizInfoUseCase(null);
    // logger.d(dataState.exception);
    // if (dataState.runtimeType == DataSuccess<List<RecentQuizModel>>) {
    //   emit(MainViewSuccessState<List<RecentQuizModel>>(dataState.data));
    // } else if (dataState.runtimeType == DataFailed) {
    //   logger.e(dataState.exception);
    //   emit(
    //       MainViewFailedState(_appErrorText.errorMessage(dataState.exception)));
    // }
  }
}
