import "package:flutter/material.dart";

class AppTheme {
  final ThemeData _lightTheme = ThemeData(
    /// brightness
    brightness: Brightness.light,

    /// widget themes
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
    scaffoldBackgroundColor: const Color(0xffefeefc),

    /// TextTheme
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Color(0xff0d092a),
      ),
    ),
  );

  ThemeData get lightTheme => _lightTheme;
}
