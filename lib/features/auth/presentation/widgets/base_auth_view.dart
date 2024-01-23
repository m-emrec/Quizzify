import 'package:flutter/material.dart';

class BaseAuthView extends StatelessWidget {
  final Widget? body;
  final String title;
  const BaseAuthView({super.key, this.body, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
    );
  }
}
