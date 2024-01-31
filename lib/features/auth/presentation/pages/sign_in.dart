import 'package:flutter/material.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/core/extensions/empty_padding_extension.dart';
import 'package:trivia/features/auth/presentation/pages/sign_in_mixin.dart';
import 'package:trivia/features/auth/presentation/widgets/base_auth_view.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_paddings.dart';
import '../../../../core/shared/widgets/buttons/responsive_elevated_button.dart';
import '../../../../core/shared/widgets/clikable_text.dart';
import '../widgets/alternative_auth_methods.dart';
import '../widgets/input_fields.dart';

class SignInPage extends StatefulWidget {
  static const route = "sign-in";
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with SignInMixin {
  @override
  Widget build(BuildContext context) {
    return BaseAuthView(
      body: Column(
        children: [
          //! Alternative Sing up methods
          const AlternativeAuthMethods(),
          48.ph,

          /// Input Fields
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //! Email field
              EmailField(
                context,
                controller: emailController,
                textInputAction: TextInputAction.next,
              ),
              64.ph,

              //! Password field
              PasswordTextField(
                context,
                controller: passwordController,
              ),
              //! login button
              32.ph,
              Row(
                children: [
                  ResponsiveElevatedButton(
                    label: loginButtonLabel,
                    onPressed: () {},
                  ),
                ],
              ),
              16.ph,

              /// you don't have an account text
              ClickableText(
                text: youDontHaveAccountText,
              ),
              16.ph,
              //! Forget password button
              TextButton(
                onPressed: () {},
                child: Text(
                  forgotPasswordButtonLabel,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: AppColors().elevatedButtonColor,
                  ),
                ),
              ),
              16.ph,
              //! Terms and Services and Privacy policy Text
              termsAndServicesText(context),
            ],
          ),
        ],
      ),
      title: "Sign In",
    );
  }
}
