import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../bloc/auth_bloc.dart';
import '../pages/forgot_password_page.dart';

mixin ForgotPasswordMixin on State<ForgotPassword> {
  final String pageTitle = "Reset Password";
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String bodyText =
      "Enter your email and we will send you a link to reset your password.";
  final String resetPasswordButtonLabel = "Reset Password";

  /// get it
  final GetIt sl = GetIt.instance;

  /// bloc
  late AuthBloc authBloc;
  @override
  void initState() {
    super.initState();
    authBloc = sl<AuthBloc>();
  }

  void resetPassword() {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        authBloc.add(
          AuthForgotPasswordEvent(
            email: emailController.text,
          ),
        );
      }
    }
  }
}
