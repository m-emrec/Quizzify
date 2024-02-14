import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:trivia/features/main-view/presentation/widgets/quizzes_sheet.dart';

import '../../../../core/constants/enums/injection_enums.dart';
import '../../data/models/live_quizzes_model.dart';
import '../bloc/main_view_bloc.dart';

mixin QuizzesSheetMixin on State<QuizzesSheet> {
  late MainViewBloc _bloc;
  MainViewBloc get bloc => _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = _bloc = GetIt.I<MainViewBloc>();
    _bloc.add(GetLiveQuizzesEvent());
  }

  /// onRefresh clear the ListOfQuizzes from GetIt then call [GetLiveQuizzesEvent]
  ///
  Future<void> onRefresh(List<LiveQuizzesModel>? data) async {
    await GetIt.I.unregister<List<LiveQuizzesModel>>(
        instanceName: InjectionEnum.listOfQuizzes.name);
    _bloc.add(GetLiveQuizzesEvent());
  }
}
