import 'package:flutter/material.dart';
import 'package:trivia/features/auth/presentation/pages/sign_up.dart';

class AppRoutes {
  final Map<String, Widget Function(BuildContext)> _routes = {
    SignUpPage.route: (p0) => const SignUpPage(),
  };
  Map<String, Widget Function(BuildContext)> get routes => _routes;
}
