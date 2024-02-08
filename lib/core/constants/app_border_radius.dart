import 'package:flutter/material.dart';

class AppBorderRadius {
  final BorderRadius _inputBorderRadius = BorderRadius.circular(24);
  BorderRadius get inputBorderRadius => _inputBorderRadius;

  final _buttonBorderRadius = BorderRadius.circular(24);
  BorderRadius get buttonBorderRadius => _buttonBorderRadius;

  static const double bottomNavBarCornerRadius = 16;

  /// 8
  static const double smallBorderRadius = 8;

  /// 16
  static const double mediumBorderRadius = 16;

  /// 32
  static const double bigBorderRadius = 32;
}
