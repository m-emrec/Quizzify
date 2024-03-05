import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Quizzify/core/extensions/context_extension.dart';
import 'package:Quizzify/features/create%20quiz/presentation/widgets/create_quiz_base_view.dart';

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

  final Duration openKeyboardAnimationDuration = Duration(milliseconds: 300);
  final Duration closeKeyboardAnimationDuration = Duration(milliseconds: 600);

  /// I use this function to scroll the scaffold after keyboard opened.
  void resizeScaffold() {
    //if keyboard is opened scroll to keyboardSize / 2
    if (context.keyboardSize > 0 && scrollController.hasClients) {
      scrollController.animateTo(
        context.keyboardSize / 2,
        duration: openKeyboardAnimationDuration,
        curve: Curves.linear,
      );
      // if keyboard is not opened and [scrollController] has clients . Scroll  to top
    } else {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.minScrollExtent,
          duration: closeKeyboardAnimationDuration,
          curve: Curves.linear,
        );
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  final ScrollController scrollController = ScrollController();
}
