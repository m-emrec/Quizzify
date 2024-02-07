import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trivia/core/constants/app_color.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/features/home-view-manager/presentation/mixins/home_view_manager_mixin.dart';
import 'package:trivia/features/home-view-manager/presentation/pages/home_base_view.dart';

enum HomeViewEnum {
  home,
  discover,
  leaderboard,
  profile,
}

class HomeViewManager extends StatefulWidget {
  static const String route = "home-view-manager";
  const HomeViewManager({super.key});

  @override
  State<HomeViewManager> createState() => _HomeViewManagerState();
}

class _HomeViewManagerState extends State<HomeViewManager>
    with HomeViewManagerMixin {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(
        appBarTheme: context.theme.appBarTheme.copyWith(
          backgroundColor: AppColors.homeScaffoldColor,
          systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: AppColors.bottomNavBarColor,
            statusBarIconBrightness: Brightness.light,
          ),
          titleTextStyle: context.theme.appBarTheme.titleTextStyle?.copyWith(
            color: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: AppColors.homeScaffoldColor,
      ),
      child: HomeBaseView(
        appBar: viewManagerFunc(bottomNavIndex).appBar,
        body: AnimatedSwitcher(
            duration: animationDuration,
            child: viewManagerFunc(bottomNavIndex).body),
        bottomNavBarOnTap: bottomNavBarOnTap,
        bottomNavBarIndex: bottomNavIndex,
      ),
    );
  }
}
