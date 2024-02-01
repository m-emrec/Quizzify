import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:trivia/core/extensions/navigation_extension.dart';
import 'package:trivia/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:trivia/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:trivia/features/auth/presentation/pages/sign_in.dart';
import 'package:trivia/features/auth/presentation/pages/sign_up.dart';

mixin SignInMixin on State<SignInPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// controllers
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;
  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  /// Strings
  final String _pageTitle = "Sign In";
  String get pageTitle => _pageTitle;
  final String _loginButtonLabel = "Sign In";
  String get loginButtonLabel => _loginButtonLabel;
  final String _forgotPasswordButtonLabel = 'Forgot Password?';
  String get forgotPasswordButtonLabel => _forgotPasswordButtonLabel;
  final String _youDontHaveAccountText = "Don't have an account?";
  String get youDontHaveAccountText => _youDontHaveAccountText;

  /// functions
  onTapDontHaveAnAccount(BuildContext context) =>
      context.pushReplacementNamed(SignUpPage.route);

  /// get it
  final GetIt sl = GetIt.instance;

  /// bloc
  late AuthBloc authBloc;

  /// functions

  //? lifecycle functions
  /// initState
  @override
  void initState() {
    super.initState();
    authBloc = sl<AuthBloc>();
  }

  onTapForgotPassword(BuildContext context) =>
      context.pushNamed(ForgotPassword.route);

  void onTapSignIn() {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        sl<AuthBloc>().add(
          AuthSignInWithEmailEvent(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
      }
    }
  }
}
