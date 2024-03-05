import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/extensions/image_extension.dart';
import '../../data/datasources/onboarding_injection_container.dart';
import '../../domain/repositories/onboarding_repo.dart';
import '../bloc/onboarding_bloc.dart';
import '../pages/onboarding_page.dart';

mixin OnboardingMixin on State<Onboarding> {
  // Variables
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController controller;
  final PageController pageController = PageController();
  late OnboardingBloc bloc;
  final OnboardingInjectionContainer _onboardingInjectionContainer =
      OnboardingInjectionContainer();

  /// life cycle functions
  @override
  void initState() {
    final GetIt sl = GetIt.instance;
    super.initState();

    bool isAlreadyRegistered =
        GetIt.instance.isRegistered(instance: OnboardingRepo);

    if (!isAlreadyRegistered) _onboardingInjectionContainer.initialize();

    bloc = sl<OnboardingBloc>();
    controller = TextEditingController(text: widget.displayName ?? "");
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
    controller.dispose();
    _onboardingInjectionContainer.dispose();
  }

  final List titles = const [
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
