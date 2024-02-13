part of 'main_view_bloc.dart';

abstract class MainViewEvent extends Equatable {
  const MainViewEvent();

  @override
  List<Object> get props => [];
}

class MainViewInitialEvent extends MainViewEvent {}

class GetAppBarInfoEvent extends MainViewEvent {}

class GetFriendsInfoEvent extends MainViewEvent {}

class GetLiveQuizzesEvent extends MainViewEvent {}

class GetRecentQuizzesEvent extends MainViewEvent {}
