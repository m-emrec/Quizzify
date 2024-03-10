import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import '../../core/constants/app_border_radius.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/enums/app_paddings.dart';

final AppTextThemes _appTextTheme = AppTextThemes();

class AppTheme {
  final ThemeData _lightTheme = ThemeData(
    /// brightness
    brightness: Brightness.light,

    /// widget themes
    /// App bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.scaffoldColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.scaffoldColor,
      ),
      titleTextStyle: _appTextTheme.textTheme.titleLarge,
      surfaceTintColor: Colors.transparent,
    ),
    scaffoldBackgroundColor: AppColors.scaffoldColor,

    /// [Tooltip] theme
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.elevatedButtonColor,
        borderRadius: BorderRadius.circular(AppBorderRadius.mediumBorderRadius),
      ),
      margin: AppPaddings().pageHPadding,
    ),

    /// Bottom navigation bar theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.bottomNavBarColor,
      elevation: 0,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black54,
    ),

    /// [FloatingActionButton] theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.elevatedButtonColor,
      foregroundColor: Colors.white,
      elevation: 3,
    ),

    /// TextTheme
    textTheme: _appTextTheme.textTheme,
  );

  ThemeData get lightTheme => _lightTheme;
}

class AppTextThemes {
  final TextTheme _textTheme = const TextTheme(
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.textColor,
    ),
    labelLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      color: AppColors.labelSmallColor,
      fontWeight: FontWeight.bold,
    ),
    labelSmall: TextStyle(
      fontSize: 14,
      color: AppColors.labelSmallColor,
      fontWeight: FontWeight.w400,
    ),
  );

  TextTheme get textTheme => _textTheme;
}
