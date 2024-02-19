import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  NavigatorState get navigator => Navigator.of(this);
  Future<T?> pushNamed<T extends Object?>(route, {Object? arguments}) =>
      navigator.pushNamed(route, arguments: arguments);
  pop() => navigator.pop();
  pushReplacementNamed(routeName) => navigator.pushReplacementNamed(routeName);
}
