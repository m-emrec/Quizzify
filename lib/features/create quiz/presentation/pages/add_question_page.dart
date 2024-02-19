import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trivia/core/constants/app_color.dart';
import 'package:trivia/core/constants/app_paddings.dart';
import 'package:trivia/features/create%20quiz/presentation/widgets/add_cover_image_container.dart';
import 'package:trivia/features/create%20quiz/presentation/widgets/create_quiz_base_view.dart';
import 'package:trivia/features/create%20quiz/presentation/widgets/quiz_name_field.dart';
import 'package:trivia/logger.dart';

import '../../../../core/constants/app_border_radius.dart';

class AddQuestionPage extends StatelessWidget {
  static const route = "add-question";
  const AddQuestionPage({super.key});

  final String floatingActionButtonLabel = "Add Question";
  final String appBarTitle = "Create Quiz";
  @override
  Widget build(BuildContext context) {
    return CreateQuizBaseView(
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            // Question number row
            SizedBox(
              height: constraints.maxHeight * 0.1,
              child: _QuestionNumberRow(),
            ),
            // Cover Image
            AddCoverImageContainer(),

            // Duration and question type row
            Gap(AppPaddings.mediumPadding),
            _DurationAndQuestionTypeRow(),
            Gap(AppPaddings.mediumPadding),
            // Question Field
            QuizNameField(
              context,
              label: "Add Question",
            ),
            Gap(AppPaddings.smallPadding),
            // Answers grid
            _AnswersGrid(),
          ],
        );
      }),
      floatingActionButtonLabel: floatingActionButtonLabel,
      appBarTitle: appBarTitle,
    );
  }
}

class _QuestionNumberRow extends StatelessWidget {
  const _QuestionNumberRow();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      findChildIndexCallback: (key) {
        // logger.i(key);

        return 20;
      },
      itemCount: 100,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => CircleAvatar(
        radius: 16,
        // key: ValueKey(index + 1),
        // backgroundColor: Colors.transparent,
        child: Text("${index + 1}"),
      ),
    );
  }
}

class _DurationAndQuestionTypeRow extends StatelessWidget {
  const _DurationAndQuestionTypeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DropdownButton(
          icon: Icon(
            Icons.access_time_rounded,
            color: AppColors.elevatedButtonColor,
          ),
          items: [],
          onChanged: (_) {},
        ),
        DropdownButton(
          items: [],
          onChanged: (_) {},
        ),
      ],
    );
  }
}

class _AnswersGrid extends StatelessWidget {
  const _AnswersGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppPaddings.bigPadding),
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 3,
            crossAxisSpacing: AppPaddings.smallPadding,
            mainAxisSpacing: AppPaddings.smallPadding,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius:
                  BorderRadius.circular(AppBorderRadius.mediumBorderRadius),
              child: Material(
                elevation: 1,
                color: AppColors.scaffoldColor,
                child: InkWell(
                  onTap: () {},
                  child: Card(
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        Text("data"),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
