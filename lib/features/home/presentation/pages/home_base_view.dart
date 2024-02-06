import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:trivia/core/constants/app_border_radius.dart';
import 'package:trivia/core/constants/app_color.dart';
import 'package:trivia/core/extensions/context_extension.dart';

class HomeBaseView extends StatefulWidget {
  static const route = "home-base";
  const HomeBaseView(
      {super.key,
      this.body,
      required this.bottomNavBarOnTap,
      required this.bottomNavBarIndex,
      this.appBar});
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final dynamic Function(int) bottomNavBarOnTap;
  final int bottomNavBarIndex;

  @override
  State<HomeBaseView> createState() => _HomeBaseViewState();
}

class _HomeBaseViewState extends State<HomeBaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      backgroundColor: AppColors.homeScaffoldColor,
      extendBodyBehindAppBar: true,
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: widget.body,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: context.theme.bottomNavigationBarTheme.selectedItemColor,
        inactiveColor:
            context.theme.bottomNavigationBarTheme.unselectedItemColor,
        backgroundColor: context.theme.bottomNavigationBarTheme.backgroundColor,
        icons: const [
          Icons.home,
          Icons.search_outlined,
          Icons.leaderboard_outlined,
          Icons.person_outline_outlined,
        ],
        activeIndex: widget.bottomNavBarIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: AppBorderRadius.bottomNavBarCornerRadius,
        rightCornerRadius: AppBorderRadius.bottomNavBarCornerRadius,
        onTap: (index) => widget.bottomNavBarOnTap(index),
      ),
    );
  }
}
