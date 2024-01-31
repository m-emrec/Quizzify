import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  NavigatorState get navigator => Navigator.of(this);
}
