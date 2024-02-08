import 'package:flutter/material.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/features/main-view/presentation/widgets/home_appbar.dart';

import '../../../../core/constants/app_paddings.dart';
import '../../../../logger.dart';
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

                          /// Friends card
                          FriendsCard(),
                        ],
                      ),
                    ),

                    /// Quizzes sheet
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: Colors.red,
                        width: context.dynamicWidth(1),
                        height: context.dynamicHeight(0.5),
                      ),
                    ),
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
