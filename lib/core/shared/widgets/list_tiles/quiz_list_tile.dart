import 'package:flutter/material.dart';
import 'package:trivia/core/constants/app_color.dart';
import 'package:trivia/core/extensions/context_extension.dart';

import '../../../constants/app_border_radius.dart';
import '../../../constants/app_paddings.dart';

class QuizListTile extends StatelessWidget {
  const QuizListTile({
    super.key,
    required this.image,
    required this.title,
    required this.category,
    required this.numberOfQuestions,
  });

  final ImageProvider<Object> image;
  final String title;
  final String category;
  final String numberOfQuestions;

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: ListTile(
        // Image
        leading: AspectRatio(
          aspectRatio: 1,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppBorderRadius.mediumBorderRadius),
            ),
            child: Image(
              fit: BoxFit.cover,
              image: image,
            ),
          ),
        ),
        // Title
        title: Text(
          title,
          style: context.textTheme.labelLarge,
        ),
        // subtitle
        subtitle: Text(
          category + " · " + numberOfQuestions + " Quizzes",
          style: context.textTheme.labelSmall,
        ),

        /// Button
        trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.arrow_forward_ios_rounded),
          style: IconButton.styleFrom(
            foregroundColor: AppColors.elevatedButtonColor,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppBorderRadius.mediumBorderRadius),
          side: BorderSide(
            color: Color(0xffEFEEFC),
            width: 2,
          ),
        ),
        minVerticalPadding: AppPaddings.mediumPadding,
      ),
    );
  }
}
