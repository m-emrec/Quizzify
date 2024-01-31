import "package:flutter/material.dart";
import 'package:trivia/core/constants/app_color.dart';

final AppColors _appColors = AppColors();
final AppTextThemes _appTextTheme = AppTextThemes();

class AppTheme {
  final ThemeData _lightTheme = ThemeData(
    /// brightness
    brightness: Brightness.light,

    /// widget themes
    appBarTheme: AppBarTheme(
      backgroundColor: _appColors.scaffoldColor,
    ),
    scaffoldBackgroundColor: _appColors.scaffoldColor,

    /// TextTheme
    textTheme: _appTextTheme.textTheme,
  );

  ThemeData get lightTheme => _lightTheme;
}

class AppTextThemes {
  final TextTheme _textTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors().textColor,
    ),
    labelLarge: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      color: AppColors().labelSmallColor,
      fontWeight: FontWeight.bold,
    ),
    labelSmall: TextStyle(
      fontSize: 14,
      color: AppColors().labelSmallColor,
      fontWeight: FontWeight.w400,
    ),
  );

  TextTheme get textTheme => _textTheme;
}
