import 'package:flutter/material.dart';
import 'package:trivia/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:trivia/features/auth/presentation/pages/sign_in.dart';
import 'package:trivia/features/auth/presentation/pages/sign_up.dart';
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
  };
  Map<String, Widget Function(BuildContext)> get routes => _routes;
}
