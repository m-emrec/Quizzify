import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:trivia/core/constants/app_paddings.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/core/extensions/empty_padding_extension.dart';
import 'package:trivia/core/shared/widgets/buttons/responsive_elevated_button.dart';
import 'package:trivia/features/auth/presentation/mixins/auth_mixin.dart';
import 'package:trivia/features/auth/presentation/mixins/forgot_password_mixin.dart';
import 'package:trivia/features/auth/presentation/widgets/base_auth_view.dart';
import 'package:trivia/features/auth/presentation/widgets/input_fields.dart';

class ForgotPassword extends StatefulWidget {
  static const route = "forgot-password";

  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword>
    with AuthMixin, ForgotPasswordMixin {
  @override
  Widget build(BuildContext context) {
    return BaseAuthView(
      formKey: formKey,
      floatingActionButton: Padding(
        padding: AppPaddings().pageHPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResponsiveElevatedButton(
              label: "Reset Password",
              onPressed: resetPassword,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Text(
            bodyText,
            style: context.textTheme.labelSmall,
          ),
          48.ph,
          EmailField(
            context,
            controller: emailController,
            textInputAction: TextInputAction.done,
            validator: (val) => emailValidator(val ?? ""),
          ),
        ],
      ),
      title: pageTitle,
    );
  }
}
