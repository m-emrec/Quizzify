import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:trivia/core/constants/strings.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/core/extensions/empty_padding_extension.dart';
import 'package:trivia/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:trivia/features/auth/presentation/widgets/input_fields.dart';

import '../../../../core/shared/widgets/buttons/responsive_elevated_button.dart';
import '../../../../core/shared/widgets/pop_up_dialog.dart';
import '../../../../core/shared/widgets/snackbars/custom_snackbar.dart';

/// This mixin made for using on SignIn and SignUp pages.
mixin AuthMixin {
  //* [Strings]
  final String _termsOfServicesText = AppStrings().termsOfServicesText;
  final String _privacyPolicyText = AppStrings().privacyPolicyText;

  String get privacyPolicyString => " Privacy Policy ";

  String get termsOfServicesString => "Terms of Services";

  String get byContinuingText => "By continuing, you agree to the ";

  //* define [GetIt]
  final GetIt sl = GetIt.instance;

  //* define [Bloc]
  late final AuthBloc authBloc;

  //* [Bloc] Functions
  bool listenWhen(previous, current) => current is AuthActionState;

  void blocListener(BuildContext context, state) {
    switch (state.runtimeType) {
      case AuthFailedState:
        context.showSnack(
          ErrorSnack(
            context,
            text: state.exception,
          ),
        );
        break;
      case AuthSuccessState:
        state as AuthSuccessState;
        // logger.i(state.afterSuccess);
        context.showSnack(
          SuccessSnack(
            context,
            text: state.successMessage,
          ),
        );
        if (state.afterSuccess != null) state.afterSuccess!(context);
        break;

      default:
    }
  }

  //* Validator functions

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

  //* Functions

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

  //* Widget Functions
  Text termsAndServicesText(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: byContinuingText,
        style: context.textTheme.labelSmall,
        children: [
          // Clickable Text
          TextSpan(
            text: termsOfServicesString,
            recognizer: TapGestureRecognizer()
              ..onTap = () => openTermsOfServices(context),
            style: context.textTheme.labelMedium,
          ),
          const TextSpan(
            text: " & ",
          ),
          // Clickable Text
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
