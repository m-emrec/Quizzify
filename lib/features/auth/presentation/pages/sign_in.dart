import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/core/extensions/empty_padding_extension.dart';
import 'package:trivia/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:trivia/features/auth/presentation/mixins/auth_mixin.dart';
import 'package:trivia/features/auth/presentation/mixins/sign_in_mixin.dart';
import 'package:trivia/features/auth/presentation/widgets/base_auth_view.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/shared/widgets/clickable_text.dart';
import '../widgets/alternative_auth_methods.dart';
import '../widgets/auth_form.dart';

class SignInPage extends StatefulWidget {
  static const route = "sign-in";
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with SignInMixin, AuthMixin {
  @override
  Widget build(BuildContext context) {
    return BaseAuthView(
      body: BlocListener<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: blocListener,
        listenWhen: listenWhen,
        child: Column(
          children: [
            //* Alternative Sing up methods
            AlternativeAuthMethods(
              authBloc: authBloc,
            ),
            48.ph,

            //* Form Field
            AuthForm(
              context,
              formKey: formKey,
              emailController: emailController,
              passwordController: passwordController,
              buttonLabel: loginButtonLabel,
              onPressed: onTapSignIn,
            ),
            16.ph,
            //* you dont have an account button ,Forgot password button, terms and services
            Column(
              children: [
                // you don't have an account text
                ClickableText(
                  text: youDontHaveAccountText,
                  onTap: () => onTapDontHaveAnAccount(context),
                ),
                16.ph,
                // Forget password button
                TextButton(
                  onPressed: () => onTapForgotPassword(context),
                  child: Text(
                    forgotPasswordButtonLabel,
                    style: context.textTheme.labelMedium?.copyWith(
                      color: AppColors().elevatedButtonColor,
                    ),
                  ),
                ),
                16.ph,
                // Terms and Services and Privacy policy Text
                termsAndServicesText(context),
              ],
            ),
          ],
        ),
      ),
      title: pageTitle,
    );
  }
}
