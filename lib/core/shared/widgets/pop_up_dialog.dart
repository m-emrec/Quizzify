import 'package:flutter/material.dart';

class PopupDialog extends StatelessWidget {
  final String? title;
  final Widget? content;
  final List<Widget>? actions;
  const PopupDialog({
    Key? key,
    this.title,
    this.content,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(title ?? ""),
      content: content,
      actions: actions,
    );
  }
}
