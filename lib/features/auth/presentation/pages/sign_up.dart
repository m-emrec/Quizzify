// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:trivia/core/constants/app_paddings.dart';
import 'package:trivia/core/extensions/empty_padding_extension.dart';
import 'package:trivia/core/shared/widgets/buttons/responsive_elevated_button.dart';
import 'package:trivia/core/shared/widgets/clikable_text.dart';
import 'package:trivia/features/auth/presentation/pages/sign_up_mixin.dart';
import 'package:trivia/features/auth/presentation/widgets/base_auth_view.dart';

import '../widgets/alternative_auth_methods.dart';
import '../widgets/input_fields.dart';

class SignUpPage extends StatefulWidget {
  static const route = "sign-up";
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with SignUpMixin {
  @override
  Widget build(BuildContext context) {
    return BaseAuthView(
      title: pageTitle,
      body: Padding(
        padding: AppPaddings().pageHPadding,
        child: SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          child: Column(
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
                  //! sign up button
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

                  /// already have an account text
                  ClickableText(
                    text: alreadyHaveAnAccountText,
                  ),
                  16.ph,

                  //! Terms and Services and Privacy policy Text
                  termsAndServicesText(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
