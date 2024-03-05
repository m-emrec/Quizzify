import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/constants/enums/injection_enums.dart';
import '../../../../core/constants/error_texts.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/resources/use_case.dart';
import '../../../../logger.dart';
import '../../data/models/app_bar_model.dart';
import '../../data/models/friends_card_model.dart';
import '../../data/models/live_quizzes_model.dart';
import '../../data/models/recent_quiz_model.dart';
import '../../domain/usecases/get_app_bar_info_usecase.dart';
import '../../domain/usecases/get_friends_info_usecase.dart';
import '../../domain/usecases/get_live_quizzes_usecase.dart';
import '../../domain/usecases/get_recent_quiz_info_usecase.dart';

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
  final GetIt sl = GetIt.I;

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

    /// check if the LiveQuizzes are already registered to GetIt

    final bool isQuizzesModelRegistered =
        sl.isRegistered<List<LiveQuizzesModel>>(
            instanceName: InjectionEnum.listOfQuizzes.name);

    /// If it is  registered then emit success state with GetIt data
    /// I did this to prevent getting the quizzes data every time the [Home] page
    /// opened.
    if (isQuizzesModelRegistered) {
      emit(
        MainViewSuccessState<List<LiveQuizzesModel>>(
          sl<List<LiveQuizzesModel>>(
              instanceName: InjectionEnum.listOfQuizzes.name),
        ),
      );
    } else {
      await _emitStateFunc<List<LiveQuizzesModel>>(
          useCase: _getLiveQuizzesInfoUseCase, emit: emit);
    }
  }

  /// TODO : Implement this after [Discover] feature done.
  FutureOr<void> onGetFriendsInfoEvent(
      GetFriendsInfoEvent event, Emitter<MainViewState> emit) async {
    emit(MainViewLoadingState());

    //  /// check if the LiveQuizzes are already registered to GetIt
    //   final bool isQuizzesModelRegistered = sl<List<FriendsCardModel>>().isEmpty;

    //   /// If it is  registered then emit success state with GetIt data
    //   /// I did this to prevent getting the quizzes data every time the [Home] page
    //   /// opened.
    //   if (!isQuizzesModelRegistered) {
    //     emit(MainViewSuccessState<List<FriendsCardModel>>(
    //         sl<List<FriendsCardModel>>()));
    //   } else {
    //     // await _emitStateFunc<List<FriendsCardModel>>(
    //     //     useCase: _getFriendsInfoUseCase, emit: emit);
    //   }
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
