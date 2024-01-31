import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  NavigatorState get navigator => Navigator.of(this);
  pushNamed(route) => navigator.pushNamed(route);
  pop() => navigator.pop();
  pushReplacementNamed(routeName) => navigator.pushReplacementNamed(routeName);
}
