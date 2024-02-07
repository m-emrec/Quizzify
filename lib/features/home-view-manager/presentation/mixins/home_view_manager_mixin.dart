import 'package:flutter/material.dart';
import 'package:trivia/features/discover/presentation/pages/discover_view.dart';
import 'package:trivia/features/leaderboard/presentation/pages/leaderboard_view.dart';
import 'package:trivia/features/profile/presentation/pages/profile_view.dart';

import '../../../main-view/presentation/pages/home_view.dart';
import '../../data/models/home_view_manager_model.dart';
import '../view manager/home_view_manager.dart';
import '../../../main-view/presentation/widgets/home_appbar.dart';

mixin HomeViewManagerMixin on State<HomeViewManager> {
  /// This function returns a [HomeViewManagerModel] .
  /// it is used for managing the body and the appbar of the [HomeBaseView].
  /// it gets index from [_HomeBottomNavigationBar]'s activeIndex value and
  /// returns the related view.
  HomeViewManagerModel viewManagerFunc(int index) {
    /// return [HomeView]
    if (index == HomeViewEnum.home.index) {
      return HomeViewManagerModel(
        appBar: HomeAppBar(),
        body: const HomeView(),
      );

      /// return [DiscoverView]
    } else if (index == HomeViewEnum.discover.index) {
      return HomeViewManagerModel(
        appBar: AppBar(
          title: const Text("Discover"),
        ),
        body: const DiscoverView(),
      );
    } else if (index == HomeViewEnum.leaderboard.index) {
      return HomeViewManagerModel(
        appBar: AppBar(
          title: const Text("LeaderBoard"),
        ),
        body: const LeaderboardView(),
      );
    } else if (index == HomeViewEnum.profile.index) {
      return HomeViewManagerModel(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        body: const ProfileView(),
      );
    }
    return HomeViewManagerModel(
        body: const Center(
      child: Text("Error"),
    ));
  }

  /// This function used to manage [_bottomNavIndex]
  void bottomNavBarOnTap(int index) {
    setState(() => _bottomNavIndex = index);
  }

  int _bottomNavIndex = 0;
  int get bottomNavIndex => _bottomNavIndex;
  final Duration animationDuration = const Duration(milliseconds: 300);
}
