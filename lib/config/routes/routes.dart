import 'package:flutter/material.dart';
import 'package:trivia/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:trivia/features/auth/presentation/pages/sign_in.dart';
import 'package:trivia/features/auth/presentation/pages/sign_up.dart';
import 'package:trivia/features/create%20quiz/presentation/pages/add_question_page.dart';
import 'package:trivia/features/create%20quiz/presentation/pages/choose_category_page.dart';
import 'package:trivia/features/create%20quiz/presentation/pages/create_quiz_page.dart';
import 'package:trivia/features/create%20quiz/presentation/pages/overview_page.dart';
import 'package:trivia/features/onboarding/presentation/pages/onboarding_page.dart';

import '../../features/auth/presentation/pages/auth_manager.dart';
import '../../features/home-view-manager/presentation/view manager/home_view_manager.dart';

class AppRoutes {
  final Map<String, Widget Function(BuildContext)> _routes = {
    "/": (p0) => const AuthManager(),
    ForgotPassword.route: (p0) => const ForgotPassword(),
    SignUpPage.route: (p0) => const SignUpPage(),
    SignInPage.route: (p0) => const SignInPage(),
    Onboarding.route: (p0) => const Onboarding(),
    HomeViewManager.route: (p0) => const HomeViewManager(),
    CreateQuizPage.route: (p0) => const CreateQuizPage(),
    ChooseCategoryPage.route: (p0) => ChooseCategoryPage(),
    AddQuestionPage.route: (p0) => const AddQuestionPage(),
    OverViewPage.route: (p0) => const OverViewPage(),
  };
  Map<String, Widget Function(BuildContext)> get routes => _routes;
}
