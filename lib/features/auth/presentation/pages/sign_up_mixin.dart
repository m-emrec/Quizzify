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

  final String _termsOfServicesText = AppStrings().termsOfServicesText;
  final String _privacyPolicyText = AppStrings().privacyPolicyText;

  final String _alreadyHaveAnAccountText = 'Already have an account?';
  String get alreadyHaveAnAccountText => _alreadyHaveAnAccountText;

  String get privacyPolicyString => " Privacy Policy ";

  String get termsOfServicesString => "Terms of Services";

  String get byContinuingText => "By continuing, you agree to the ";

  /// get it
  final GetIt sl = GetIt.instance;

  /// bloc
  late AuthBloc authBloc;

  /// functions

//? bloc functions
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
      case AuthSuccessState:
        context.showSnack(
          SuccessSnack(
            context,
            text: "Successfully signed up.",
          ),
        );
        break;
      default:
    }
  }

  //? lifecycle functions
  /// initState
  @override
  void initState() {
    super.initState();
    AuthInjectionContainer().initialize();
    authBloc = sl<AuthBloc>();
  }

  void onTapSignUp() {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        sl<AuthBloc>().add(
          AuthSignUpWithEmail(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
      }
    }
  }

  // ? Validator functions
  String? emailValidator() {
    logger.i(emailController.text);
    bool isValid = EmailValidator.validate(emailController.text);
    if (isValid == false) {
      return "Please provide valid email";
    }
    return null;
  }

  String? passwordValidator() {
    if (passwordController.text.length < 6) {
      return "Your password must be longer than 6 characters!";
    }
    return null;
  }

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

  void onTapAlreadyHaveAccount() {
    context.pushReplacementNamed(SignInPage.route);
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
