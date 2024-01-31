import 'package:flutter/material.dart';
import 'package:trivia/core/extensions/context_extension.dart';

class ClickableText extends StatelessWidget {
  const ClickableText({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: context.textTheme.labelSmall,
      ),
    );
  }
}
