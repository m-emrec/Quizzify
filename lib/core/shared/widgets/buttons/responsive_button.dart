import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  final String? label;
  final void Function()? onPressed;
  final Widget? child;
  const ResponsiveButton({
    super.key,
    this.child,
    this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
