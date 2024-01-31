import 'package:flutter/material.dart';

import '../../../../core/constants/app_paddings.dart';

class BaseAuthView extends StatelessWidget {
  final Widget body;
  final String title;
  const BaseAuthView({super.key, required this.body, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: AppPaddings().pageHPadding,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: body,
          ),
        ),
      ),
    );
  }
}
