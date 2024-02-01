import 'package:flutter/material.dart';
import 'package:trivia/core/extensions/context_extension.dart';

import '../../../../core/constants/app_paddings.dart';

class BaseAuthView extends StatelessWidget {
  final Widget body;
  final String title;
  final GlobalKey<FormState>? formKey;
  final Widget? floatingActionButton;
  const BaseAuthView({
    super.key,
    required this.body,
    required this.title,
    this.formKey,
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
            child: Form(
              key: formKey,
              child: body,
            ),
          ),
        ),
      ),
    );
  }
}
