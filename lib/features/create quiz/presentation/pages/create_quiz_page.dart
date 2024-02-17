import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trivia/core/constants/app_border_radius.dart';
import 'package:trivia/core/constants/app_color.dart';
import 'package:trivia/core/constants/app_paddings.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/core/extensions/navigation_extension.dart';
import 'package:trivia/features/create%20quiz/presentation/pages/choose_category_page.dart';
import 'package:trivia/features/create%20quiz/presentation/widgets/create_quiz_base_view.dart';
import 'package:trivia/logger.dart';

import '../widgets/add_cover_image_container.dart';
import '../widgets/quiz_name_field.dart';

class CreateQuizPage extends StatefulWidget {
  static const route = "create-quiz";
  const CreateQuizPage({super.key});

  @override
  State<CreateQuizPage> createState() => _CreateQuizPageState();
}

class _CreateQuizPageState extends State<CreateQuizPage> {
  final String appBarTitle = "Create Quiz";

  final String floatingActionButtonLabel = "Add Question";

  @override
  Widget build(BuildContext context) {
    return CreateQuizBaseView(
      appBarTitle: appBarTitle,
      showActions: true,
      showDuplicate: false,
      body: Column(
        children: [
          AddCoverImageContainer(),
          MaxGap(AppPaddings.bigPadding),
          Form(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuizNameField(
                      context,
                      hintText: "Enter quiz title",
                      label: "Title",
                    ),
                    Gap(AppPaddings.bigPadding),
                    _ChooseQuizCategoryButton(),
                    Gap(AppPaddings.bigPadding),
                    QuizNameField(
                      context,
                      expands: true,
                      label: "Description",
                      hintText: "Enter quiz description",
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLabel: floatingActionButtonLabel,
      onFloatingActionButtonPressed: () {},
    );
  }
}

class _ChooseQuizCategoryButton extends StatelessWidget {
  const _ChooseQuizCategoryButton();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Quiz Category",
                style: context.textTheme.labelMedium?.copyWith(
                  color: Colors.black,
                ),
              ),
              Gap(AppPaddings.smallPadding),
              OutlinedButton(
                onPressed: () =>
                    context.pushNamed(ChooseCategoryPage.route).then(
                          (_) => logger.i(_),
                        ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Choose quiz category",
                      style: context.textTheme.labelSmall,
                    ),
                    Icon(Icons.chevron_right_sharp),
                  ],
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: AppColors.scaffoldColor,
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      AppBorderRadius.mediumBorderRadius,
                    ),
                  ),
                  padding: EdgeInsets.all(
                    AppPaddings.mediumPadding,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
