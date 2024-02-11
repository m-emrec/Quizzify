import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:trivia/core/extensions/empty_padding_extension.dart';
import 'package:trivia/features/main-view/data/datasources/home_injection_container.dart';
import 'package:trivia/features/main-view/presentation/bloc/main_view_bloc.dart';
import 'package:trivia/features/main-view/presentation/widgets/home_appbar.dart';
import 'package:trivia/features/main-view/presentation/widgets/quizzes_sheet.dart';

import '../../../../core/constants/app_paddings.dart';
import '../widgets/friends_card.dart';
import '../widgets/recent_quiz_card.dart';

class HomeView extends StatefulWidget {
  static const route = "home";
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await HomeInjectionContainer().initialize();
  }

  @override
  void dispose() async {
    super.dispose();
    HomeInjectionContainer().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: HomeAppBar(),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Padding(
                padding: AppPaddings().pageTopPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// Recent quizzes and Friends
                    Padding(
                      padding: AppPaddings().pageHPadding,
                      child: Column(
                        children: [
                          /// Recent quiz card
                          RecentQuizCard(),
                          AppPaddings.bigPadding.ph,

                          /// Friends card
                          FriendsCard(),
                        ],
                      ),
                    ),
                    AppPaddings.bigPadding.ph,

                    /// Quizzes sheet
                    QuizzesSheet(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
