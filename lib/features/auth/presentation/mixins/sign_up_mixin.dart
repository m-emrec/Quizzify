import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/core/extensions/navigation_extension.dart';
import 'package:trivia/features/auth/presentation/pages/sign_in.dart';
import 'package:trivia/features/auth/presentation/pages/sign_up.dart';
import 'package:trivia/logger.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/shared/widgets/pop_up_dialog.dart';
import '../../../../core/shared/widgets/snackbars/custom_snackbar.dart';
import '../../data/datasources/auth_injection_container.dart';
import '../bloc/auth_bloc.dart';

mixin SignUpPageMixin on State<SignUpPage> {
  /// form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// controllers
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;
  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  /// Strings
  final String _pageTitle = "Sign Up";
  String get pageTitle => _pageTitle;
  final String _loginButtonLabel = "Sign Up";
  String get loginButtonLabel => _loginButtonLabel;

  final String _alreadyHaveAnAccountText = 'Already have an account?';
  String get alreadyHaveAnAccountText => _alreadyHaveAnAccountText;

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
