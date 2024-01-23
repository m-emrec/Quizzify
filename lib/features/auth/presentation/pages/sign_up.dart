import 'package:flutter/material.dart';
import 'package:trivia/features/auth/presentation/widgets/base_auth_view.dart';

class SignUpPage extends StatefulWidget {
  static const route = "sign-up";
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return BaseAuthView(
      title: "Sign Up",
    );
  }
}
