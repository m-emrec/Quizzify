import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:trivia/core/constants/strings.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/features/auth/presentation/bloc/auth_bloc.dart';

import '../../../../core/shared/widgets/pop_up_dialog.dart';
import '../../../../core/shared/widgets/snackbars/custom_snackbar.dart';
import '../../../../logger.dart';

mixin AuthMixin {
  final String _termsOfServicesText = AppStrings().termsOfServicesText;
  final String _privacyPolicyText = AppStrings().privacyPolicyText;

  String get privacyPolicyString => " Privacy Policy ";

  String get termsOfServicesString => "Terms of Services";

  String get byContinuingText => "By continuing, you agree to the ";

  /// get it
  final GetIt sl = GetIt.instance;

  /// bloc
  late AuthBloc authBloc;

  bool listenWhen(previous, current) => current is AuthActionState;
  void blocListener(BuildContext context, state) {
    switch (state.runtimeType) {
      case AuthFailedState:
        state as AuthFailedState;
        logger.e(state.exception);
        context.showSnack(
          ErrorSnack(
            context,
            text: state.exception,
          ),
        );
        break;

      default:
    }
  }

  // ? Validator functions
  String? emailValidator(String email) {
    bool isValid = EmailValidator.validate(email);
    if (isValid == false) {
      return "Please provide valid email";
    }
    return null;
  }

  String? passwordValidator(String password) {
    if (password.length < 6) {
      return "Your password must be longer than 6 characters!";
    }
    return null;
  }

  void openTermsOfServices(BuildContext context) {
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

  void openPrivacyPolicy(BuildContext context) {
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
            recognizer: TapGestureRecognizer()
              ..onTap = () => openTermsOfServices(context),
            style: context.textTheme.labelMedium,
          ),
          const TextSpan(
            text: " & ",
          ),
          TextSpan(
            text: privacyPolicyString,
            recognizer: TapGestureRecognizer()
              ..onTap = () => openPrivacyPolicy(context),
            style: context.textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
