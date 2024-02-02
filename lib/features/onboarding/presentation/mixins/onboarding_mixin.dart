import 'package:flutter/widgets.dart';
import 'package:trivia/core/extensions/image_extension.dart';
import 'package:trivia/features/onboarding/presentation/pages/onboarding_page.dart';

mixin OnboardingMixin on State<Onboarding> {
  final PageController pageController = PageController();
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  final List titles = [
    "Create,share and play quizzes whenever and wherever you want",
    "Find fun and interesting quizzes to boost up your knowledge",
    "Play and take quiz challenges together with your friends.",
  ];
  int pageIndex = 0;

  void onPageChanged(int page) {
    setState(() {
      pageIndex = page;
    });
  }

  BoxDecoration backgroundImage() {
    var backgroundImagePath = "onboarding_background";
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          backgroundImagePath.toPng,
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
