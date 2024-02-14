import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../bloc/main_view_bloc.dart';
import '../widgets/recent_quiz_card.dart';

mixin RecentQuizCardMixin on State<RecentQuizCard> {
  late MainViewBloc _bloc;
  MainViewBloc get bloc => _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = GetIt.I<MainViewBloc>();
    _bloc.add(GetRecentQuizzesEvent());
  }

  /// TODO: implement navigate to recent quiz.
  void onTap() {}
}
