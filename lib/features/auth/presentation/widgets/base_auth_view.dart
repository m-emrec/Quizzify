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
    this.canPop = false,
  });

  final bool canPop;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      child: Scaffold(
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text(title),
        ),
        body: SafeArea(
          child: Padding(
            padding: AppPaddings().pageHPadding + AppPaddings().pageTopPadding,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: body,
            ),
          ),
        ),
      ),
    );
  }
}
