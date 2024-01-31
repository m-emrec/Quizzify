import 'package:flutter/material.dart';
import 'package:trivia/features/auth/presentation/pages/sign_in.dart';
import 'package:trivia/features/auth/presentation/pages/sign_up.dart';

import '../../features/auth/presentation/pages/auth_manager.dart';

class AppRoutes {
  final Map<String, Widget Function(BuildContext)> _routes = {
    "/": (p0) => const AuthManager(),
    SignUpPage.route: (p0) => const SignUpPage(),
    SignInPage.route: (p0) => const SignInPage(),
  };
  Map<String, Widget Function(BuildContext)> get routes => _routes;
}
