import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../../../../core/constants/app_paddings.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/empty_padding_extension.dart';
import '../../../../core/shared/widgets/buttons/responsive_elevated_button.dart';
import '../mixins/auth_mixin.dart';
import '../mixins/forgot_password_mixin.dart';
import '../widgets/base_auth_view.dart';
import '../widgets/input_fields.dart';

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
      canPop: true,
      // reset password button.
      floatingActionButton: Padding(
        padding: AppPaddings().pageHPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResponsiveElevatedButton(
              label: resetPasswordButtonLabel,
              onPressed: resetPassword,
            ),
          ],
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
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
      ),
      title: pageTitle,
    );
  }
}
