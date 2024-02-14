import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:trivia/features/main-view/presentation/bloc/main_view_bloc.dart';
import 'package:trivia/features/main-view/presentation/widgets/friends_card.dart';

mixin FriendsCardMixin on State<FriendsCard> {
  late MainViewBloc _bloc;
  MainViewBloc get bloc => _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = GetIt.I<MainViewBloc>();
    _bloc.add(GetFriendsInfoEvent());
  }
}
