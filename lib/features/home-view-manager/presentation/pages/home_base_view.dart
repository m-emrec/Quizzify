import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_border_radius.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/navigation_extension.dart';
import '../../../create%20quiz/presentation/pages/create_quiz_page.dart';

class HomeBaseView extends StatefulWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final dynamic Function(int) bottomNavBarOnTap;
  final int bottomNavBarIndex;
  const HomeBaseView(
      {super.key,
      this.body,
      required this.bottomNavBarOnTap,
      required this.bottomNavBarIndex,
      this.appBar});

  @override
  State<HomeBaseView> createState() => _HomeBaseViewState();
}

class _HomeBaseViewState extends State<HomeBaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeScaffoldColor,
      extendBody: true,
      floatingActionButton: const _FloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: widget.body,
      bottomNavigationBar: _HomeBottomNavigationBar(widget: widget),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  void addQuizzesToFirestore(
      String category, List<List<Map<String, dynamic>>> quizData) async {
    for (List<Map<String, dynamic>> quizzes in quizData) {
      for (var quiz in quizzes) {
        await FirebaseFirestore.instance
            .collection("Categories")
            .doc(category)
            .set({"_": ""});
        await FirebaseFirestore.instance
            .collection("Categories")
            .doc(category)
            .collection("Quizzes")
            .add({
          "title": quiz["question"],
          "description": "",
          "photo": "",
          "createdDate": DateTime.now(),
          "createdBy": FirebaseAuth.instance.currentUser?.uid,
          "playedCount": 0,
          "qid": "",
        }).then((value) {
          value.update({"qid": value.id});

          for (Map<String, dynamic> map in quizzes) {
            value.collection("Questions").add(map);
          }
        });
      }
    }
  }

  void onTap(BuildContext ctx) {
    ctx.navigator.pushNamed(CreateQuizPage.route);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () => onTap(context), // onT,
      child: const Icon(Icons.add),
    );
  }
}

class _HomeBottomNavigationBar extends StatelessWidget {
  const _HomeBottomNavigationBar({
    required this.widget,
  });

  final HomeBaseView widget;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      activeColor: context.theme.bottomNavigationBarTheme.selectedItemColor,
      inactiveColor: context.theme.bottomNavigationBarTheme.unselectedItemColor,
      backgroundColor: context.theme.bottomNavigationBarTheme.backgroundColor,
      icons: const [
        Icons.home,
        Icons.search_outlined,
        Icons.leaderboard_outlined,
        Icons.person_outline_outlined,
      ],
      activeIndex: widget.bottomNavBarIndex,
      elevation: 5,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: AppBorderRadius.bottomNavBarCornerRadius,
      rightCornerRadius: AppBorderRadius.bottomNavBarCornerRadius,
      onTap: (index) => widget.bottomNavBarOnTap(index),
    );
  }
}
