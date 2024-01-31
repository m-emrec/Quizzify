import 'package:flutter/material.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/core/extensions/empty_padding_extension.dart';

import '../../../../core/shared/widgets/buttons/responsive_elevated_button.dart';

class AlternativeAuthMethods extends StatelessWidget {
  /// This widget contains Sign up with google and facebook button and a divider.
  const AlternativeAuthMethods({
    super.key,
  });

  final String _googleButtonLabel = "Sign in with Google";
  final String _facebookButtonLabel = "Sign in with Facebook";
  final String _or = "OR";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //! Google Sign up button
        Row(
          children: [
            ResponsiveGoogleSignInButton(
              label: _googleButtonLabel,
              onPressed: () {},
            ),
          ],
        ),
        16.ph,
        Row(
          children: [
            ResponsiveFacebookButton(
              label: _facebookButtonLabel,
              onPressed: () {},
            ),
          ],
        ),
        32.ph,
        //! Divider
        Row(
          children: <Widget>[
            const Expanded(
              child: Divider(
                endIndent: 8,
              ),
            ),
            Text(
              _or,
              style: context.textTheme.labelSmall,
            ),
            const Expanded(
              child: Divider(
                indent: 8,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
