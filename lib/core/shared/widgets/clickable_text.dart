import 'package:flutter/material.dart';
import 'package:trivia/core/constants/app_color.dart';
import 'package:trivia/core/extensions/context_extension.dart';

class ClickableText extends StatelessWidget {
  /// With this widget you can give onTap property to a normal Text.
  /// The difference between this widget and [TextButton] is this widget
  /// looks , behaves and uses space like a normal text.
  const ClickableText({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStatePropertyAll<Color>(
        AppColors().elevatedButtonColor.withOpacity(0.1),
      ),
      onTap: onTap,
      child: Text(
        text,
        style: context.textTheme.labelSmall,
      ),
    );
  }
}
