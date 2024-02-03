import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:trivia/core/extensions/image_extension.dart';
import 'package:trivia/features/onboarding/data/datasources/onboarding_injection_container.dart';
import 'package:trivia/features/onboarding/domain/repositories/onboarding_repo.dart';
import 'package:trivia/features/onboarding/presentation/pages/onboarding_page.dart';

import '../bloc/onboarding_bloc.dart';

mixin OnboardingMixin on State<Onboarding> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController controller;
  final PageController pageController = PageController();
  late OnboardingBloc bloc;

  @override
  void initState() {
    super.initState();
    final GetIt sl = GetIt.instance;

    bool isAlreadyRegistered =
        GetIt.instance.isRegistered(instance: OnboardingRepo);

    if (!isAlreadyRegistered) OnboardingInjectionContainer().initialize();

    bloc = sl<OnboardingBloc>();
    controller = TextEditingController(text: widget.displayName ?? "");
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
    controller.dispose();
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
