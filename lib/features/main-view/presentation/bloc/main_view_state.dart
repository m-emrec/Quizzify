part of 'main_view_bloc.dart';

abstract class MainViewState extends Equatable {
  const MainViewState();

  @override
  List<Object> get props => [];
}

class MainViewInitial extends MainViewState {}

class MainViewLoadingState extends MainViewState {}

class MainViewSuccessState<T> extends MainViewState {
  final T? data;
  MainViewSuccessState(this.data);
}

class MainViewFailedState extends MainViewState {
  final String? errorMessage;

  MainViewFailedState(this.errorMessage);
}
