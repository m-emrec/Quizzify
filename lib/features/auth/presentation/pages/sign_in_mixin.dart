import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/features/auth/presentation/pages/sign_in.dart';
import 'package:trivia/features/auth/presentation/pages/sign_up.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/shared/widgets/pop_up_dialog.dart';

mixin SignInMixin on State<SignInPage> {
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
  final String _forgotPasswordButtonLabel = 'Forgot Password?';
  String get forgotPasswordButtonLabel => _forgotPasswordButtonLabel;

  final String _youDontHaveAccountText = "Don't have an account?";
  String get youDontHaveAccountText => _youDontHaveAccountText;

  final String _termsOfServicesText = AppStrings().termsOfServicesText;
  final String _privacyPolicyText = AppStrings().privacyPolicyText;

  String get privacyPolicyString => " Privacy Policy ";

  String get termsOfServicesString => "Terms of Services";

  String get byContinuingText => "By continuing, you agree to the ";

  /// functions
  void openTermsOfServices() {
    showDialog(
      context: context,
      builder: (_) => PopupDialog(
        title: "Terms Of Conditions",
        content: SingleChildScrollView(
          child: Column(
            children: [Text(_termsOfServicesText)],
          ),
        ),
      ),
    );
  }

  void openPrivacyPolicy() {
    showDialog(
      context: context,
      builder: (_) => PopupDialog(
        title: "Privacy Policy",
        content: SingleChildScrollView(
          child: Column(
            children: [Text(_privacyPolicyText)],
          ),
        ),
      ),
    );
  }

  Text termsAndServicesText(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: byContinuingText,
        style: context.textTheme.labelSmall,
        children: [
          TextSpan(
            text: termsOfServicesString,
            recognizer: TapGestureRecognizer()..onTap = openTermsOfServices,
            style: context.textTheme.labelMedium,
          ),
          const TextSpan(
            text: " & ",
          ),
          TextSpan(
            text: privacyPolicyString,
            recognizer: TapGestureRecognizer()..onTap = openPrivacyPolicy,
            style: context.textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
