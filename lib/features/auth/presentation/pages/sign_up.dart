// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia/core/extensions/context_extension.dart';

import 'package:trivia/core/extensions/empty_padding_extension.dart';
import 'package:trivia/core/shared/widgets/buttons/responsive_elevated_button.dart';
import 'package:trivia/core/shared/widgets/clickable_text.dart';
import 'package:trivia/core/shared/widgets/snackbars/custom_snackbar.dart';
import 'package:trivia/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:trivia/features/auth/presentation/mixins/auth_mixin.dart';
import 'package:trivia/features/auth/presentation/mixins/sign_up_mixin.dart';
import 'package:trivia/features/auth/presentation/widgets/base_auth_view.dart';
import 'package:trivia/logger.dart';

import '../widgets/alternative_auth_methods.dart';
import '../widgets/input_fields.dart';

class SignUpPage extends StatefulWidget {
  static const route = "sign-up";
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SignUpPageMixin, AuthMixin {
  @override
  Widget build(BuildContext context) {
    return BaseAuthView(
      formKey: formKey,
      title: pageTitle,
      body: BlocListener<AuthBloc, AuthState>(
        bloc: authBloc,
        listenWhen: listenWhen,
        listener: blocListener,
        child: Column(
          children: [
            //! Alternative Sing up methods
            AlternativeAuthMethods(
              authBloc: authBloc,
            ),
            48.ph,

            /// Input Fields
            Column(
              children: [
                //! Email field
                EmailField(
                  context,
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  validator: (val) => emailValidator(val ?? ""),
                ),
                32.ph,

                //! Password field
                PasswordTextField(
                  context,
                  controller: passwordController,
                  validator: (value) => passwordValidator(value ?? ""),
                ),
                //! sign up button
                32.ph,
                Row(
                  children: [
                    ResponsiveElevatedButton(
                      label: loginButtonLabel,
                      onPressed: onTapSignUp,
                    ),
                  ],
                ),
                16.ph,

                /// already have an account text
                ClickableText(
                  onTap: onTapAlreadyHaveAccount,
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
    );
  }
}
