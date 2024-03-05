// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/empty_padding_extension.dart';
import '../../../../core/shared/widgets/clickable_text.dart';
import '../bloc/auth_bloc.dart';
import '../mixins/auth_mixin.dart';
import '../mixins/sign_up_mixin.dart';
import '../widgets/alternative_auth_methods.dart';
import '../widgets/auth_form.dart';
import '../widgets/base_auth_view.dart';

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
            // Form Field
            AuthForm(
              context,
              buttonLabel: loginButtonLabel,
              emailController: emailController,
              formKey: formKey,
              onPressed: onTapSignUp,
              passwordController: passwordController,
            ),
            16.ph,
            // already have an account button and terms and services
            Column(
              children: [
                // already have an account text
                ClickableText(
                  onTap: onTapAlreadyHaveAccount,
                  text: alreadyHaveAnAccountText,
                ),
                16.ph,
                // Terms and Services and Privacy policy Text
                termsAndServicesText(context),
              ],
            )
          ],
        ),
      ),
    );
  }
}
