import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/features/create%20quiz/presentation/widgets/create_quiz_base_view.dart';

import '../../../../core/constants/app_color.dart';

mixin CreateQuizBaseViewMixin on State<CreateQuizBaseView> {
  ThemeData _themeData(BuildContext context) => context.theme.copyWith(
        appBarTheme: context.theme.appBarTheme.copyWith(
          backgroundColor: AppColors.homeScaffoldColor,
          systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: AppColors.homeScaffoldColor,
            statusBarIconBrightness: Brightness.light,
          ),
          titleTextStyle: context.theme.appBarTheme.titleTextStyle?.copyWith(
            color: Colors.white,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        scaffoldBackgroundColor: AppColors.homeScaffoldColor,
      );
  ThemeData get themeData => _themeData(context);

  /// I use this widget to resize the scaffold after keyboard opened.
  void resizeScaffold() {
    if (context.keyboardSize > 0 && scrollController.hasClients) {
      scrollController.animateTo(
        context.keyboardSize / 2,
        duration: Duration(milliseconds: 400),
        curve: Curves.linear,
      );
    }
  }

  final ScrollController scrollController = ScrollController();
}
