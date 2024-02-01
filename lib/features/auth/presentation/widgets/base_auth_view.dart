import 'package:flutter/material.dart';

import '../../../../core/constants/app_paddings.dart';

class BaseAuthView extends StatelessWidget {
  final Widget body;
  final String title;

  final Widget? floatingActionButton;
  const BaseAuthView({
    super.key,
    required this.body,
    required this.title,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: AppPaddings().pageHPadding + AppPaddings().pageTopPadding,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: body,
          ),
        ),
      ),
    );
  }
}
