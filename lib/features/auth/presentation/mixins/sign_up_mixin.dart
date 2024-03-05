import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/extensions/navigation_extension.dart';
import '../bloc/auth_bloc.dart';
import '../pages/sign_in.dart';
import '../pages/sign_up.dart';

mixin SignUpPageMixin on State<SignUpPage> {
  /// form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // controllers
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;
  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  // Strings
  final String _pageTitle = "Sign Up";
  String get pageTitle => _pageTitle;
  final String _loginButtonLabel = "Sign Up";
  String get loginButtonLabel => _loginButtonLabel;
  final String _alreadyHaveAnAccountText = 'Already have an account?';
  String get alreadyHaveAnAccountText => _alreadyHaveAnAccountText;

  //define get it
  final GetIt sl = GetIt.instance;

  // define bloc
  late AuthBloc authBloc;

  /// functions
  //? lifecycle functions
  /// initState
  @override
  void initState() {
    super.initState();

    authBloc = sl<AuthBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  // button function
  void onTapSignUp() {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        sl<AuthBloc>().add(
          AuthSignUpWithEmailEvent(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
      }
    }
  }

  void onTapAlreadyHaveAccount() {
    context.pushReplacementNamed(SignInPage.route);
  }
}
