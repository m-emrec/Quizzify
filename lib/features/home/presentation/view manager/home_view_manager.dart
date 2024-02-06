import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:trivia/features/home/presentation/pages/home_base_view.dart';
import 'package:trivia/features/home/presentation/pages/home_view.dart';
import 'package:trivia/features/home/presentation/widgets/base_home_appbar.dart';

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

class _HomeViewManagerState extends State<HomeViewManager> {
  Map<String, Either<Widget, PreferredSizeWidget>> viewManagerFunc(int index) {
    if (index == HomeViewEnum.home.index) {
      return {
        "appBar": Right(HomeAppBar()),
        "body": const Left(HomeView()),
      };
    } else if (index == HomeViewEnum.discover.index) {
      return {
        "appBar": Right(
          AppBar(
            title: const Text("Discover"),
          ),
        ),
        "body": const Left(Center(child: Text("discover"))),
      };
    }
    return {};
  }

  void bottomNavBarOnTap(int index) {
    setState(() => _bottomNavIndex = index);
  }

  @override
  void initState() {
    super.initState();
  }

  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return HomeBaseView(
      appBar: viewManagerFunc(_bottomNavIndex)["appBar"]?.right,
      body: viewManagerFunc(_bottomNavIndex)["body"]?.left,
      bottomNavBarOnTap: bottomNavBarOnTap,
      bottomNavBarIndex: _bottomNavIndex,
    );
  }
}
