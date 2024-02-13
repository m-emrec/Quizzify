import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/main_view_bloc.dart';

class BlocWidgetManager<T> extends StatelessWidget {
  const BlocWidgetManager(
      {super.key,
      required this.bloc,
      required this.loadingWidget,
      required this.loadedWidget});
  final MainViewBloc bloc;
  final Widget loadingWidget;
  final Function(T? data) loadedWidget;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainViewBloc, MainViewState>(
      bloc: bloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state.runtimeType == MainViewLoadingState) {
          return loadingWidget;
        } else if (state.runtimeType == MainViewSuccessState<T>) {
          state as MainViewSuccessState<T>;
          return loadedWidget(state.data);
        }
        return SizedBox();
        //
      },
    );
  }
}
