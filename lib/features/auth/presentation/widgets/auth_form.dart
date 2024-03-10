import 'package:flutter/material.dart';

import '../../../../core/extensions/empty_padding_extension.dart';
import '../../../../core/utils/shared/widgets/buttons/responsive_elevated_button.dart';
import '../mixins/auth_mixin.dart';
import 'input_fields.dart';

class AuthForm extends StatelessWidget with AuthMixin {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String buttonLabel;
  final void Function()? onPressed;

  AuthForm(
    BuildContext context, {
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.buttonLabel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //! Email field
          EmailField(
            context,
            controller: emailController,
            textInputAction: TextInputAction.next,
            validator: (val) => emailValidator(val ?? ""),
          ),
          48.ph,

          //! Password field
          PasswordTextField(
            context,
            controller: passwordController,
            validator: (value) => passwordValidator(value ?? ""),
          ),
          //! sign up button
          48.ph,
          Row(
            children: [
              ResponsiveElevatedButton(
                label: buttonLabel,
                onPressed: onPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
