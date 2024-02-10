import 'package:flutter/material.dart';
import 'package:trivia/core/constants/app_border_radius.dart';
import 'package:trivia/core/constants/app_paddings.dart';
import 'package:trivia/core/constants/image_path.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/core/extensions/empty_padding_extension.dart';
import 'package:trivia/core/shared/widgets/shimmer_widget.dart';

import '../../../../core/shared/widgets/list_tiles/quiz_list_tile.dart';

class QuizzesSheet extends StatefulWidget {
  const QuizzesSheet({super.key});

  @override
  State<QuizzesSheet> createState() => _QuizzesSheetState();
}

class _QuizzesSheetState extends State<QuizzesSheet> {
  bool _isLoaded = true;
  @override
  Widget build(BuildContext context) {
    return _isLoaded ? _LoadedQuizzesSheet() : _LoadingQuizzesSheet();
  }
}

class _BaseQuizzesSheet extends StatelessWidget {
  const _BaseQuizzesSheet({
    // ignore: unused_element
    this.color = Colors.white,
    required this.children,
    required this.isLoaded,
  });
  final Color color;
  final List<Widget> children;
  final bool isLoaded;

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppBorderRadius.bigBorderRadius),
        ),
      ),
      width: context.dynamicWidth(1),
      height: context.dynamicHeight(0.9),
      child: Padding(
        padding: AppPaddings().pageHPadding +
            EdgeInsets.only(top: AppPaddings.bigPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Live Quizzes",
                  style: context.textTheme.titleLarge,
                ),
                TextButton(
                  onPressed: isLoaded ? onPressed : null,
                  child: Text("See all"),
                ),
              ],
            ),
            AppPaddings.smallPadding.ph,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                ...children,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadedQuizzesSheet extends StatelessWidget {
  const _LoadedQuizzesSheet();

  @override
  Widget build(BuildContext context) {
    return _BaseQuizzesSheet(
      isLoaded: true,
      children: [
        QuizListTile(
          title: "Q1",
          category: "Music",
          numberOfQuestions: "20",
          image: AssetImage(ImgPath.friendsCardBgImg),
        ),
        QuizListTile(
          title: "Q2",
          category: "Math",
          numberOfQuestions: "12",
          image: AssetImage(ImgPath.friendsCardBgImg),
        ),
        QuizListTile(
          title: "Q2",
          category: "Math",
          numberOfQuestions: "12",
          image: AssetImage(ImgPath.friendsCardBgImg),
        ),
        QuizListTile(
          title: "Q2",
          category: "Math",
          numberOfQuestions: "12",
          image: AssetImage(ImgPath.friendsCardBgImg),
        ),
        QuizListTile(
          title: "Q2",
          category: "Math",
          numberOfQuestions: "12",
          image: AssetImage(ImgPath.friendsCardBgImg),
        ),
        QuizListTile(
          title: "Q2",
          category: "Math",
          numberOfQuestions: "12",
          image: AssetImage(ImgPath.friendsCardBgImg),
        ),
      ],
    );
  }
}

class _LoadingQuizzesSheet extends StatelessWidget {
  const _LoadingQuizzesSheet();

  @override
  Widget build(BuildContext context) {
    return _BaseQuizzesSheet(
      isLoaded: false,
      children: [
        ShimmerWidget(
          height: 80,
        ),
        AppPaddings.mediumPadding.ph,
        ShimmerWidget(
          height: 80,
        ),
      ],
    );
  }
}
