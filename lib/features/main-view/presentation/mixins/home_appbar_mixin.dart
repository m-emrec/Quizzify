import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:trivia/features/main-view/presentation/bloc/main_view_bloc.dart';

import '../widgets/home_appbar.dart';

mixin HomeAppBarMixin on State<HomeAppBar> {
  late MainViewBloc _bloc;
  MainViewBloc get bloc => _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = GetIt.I<MainViewBloc>();
    _bloc.add(GetAppBarInfoEvent());
  }
}
