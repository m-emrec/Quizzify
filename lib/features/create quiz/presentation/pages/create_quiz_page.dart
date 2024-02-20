import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trivia/core/constants/app_border_radius.dart';
import 'package:trivia/core/constants/app_color.dart';
import 'package:trivia/core/constants/app_paddings.dart';
import 'package:trivia/core/constants/enums/firestore_enums.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/core/extensions/navigation_extension.dart';
import 'package:trivia/features/create%20quiz/presentation/pages/add_question_page.dart';
import 'package:trivia/features/create%20quiz/presentation/pages/choose_category_page.dart';
import 'package:trivia/features/create%20quiz/presentation/widgets/create_quiz_base_view.dart';

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
  final TextEditingController quizTitleController = TextEditingController();
  final TextEditingController quizDescController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CreateQuizBaseView(
      duplicate: false,
      appBarTitle: appBarTitle,
      body: Padding(
        padding: EdgeInsets.only(
          top: AppPaddings.mediumPadding,
        ),
        child: Column(
          children: [
            AddCoverImageContainer(),
            MaxGap(AppPaddings.bigPadding),
            _QuizForm(
              quizTitleController: quizTitleController,
              quizDescController: quizDescController,
            ),
          ],
        ),
      ),
      floatingActionButtonLabel: floatingActionButtonLabel,
      onFloatingActionButtonPressed: () =>
          context.pushNamed(AddQuestionPage.route),
    );
  }
}

class _QuizForm extends StatelessWidget {
  const _QuizForm({
    required this.quizTitleController,
    required this.quizDescController,
  });
  final TextEditingController quizTitleController;
  final TextEditingController quizDescController;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          /// QuizTitle field
          QuizNameField(
            context,
            hintText: "Enter quiz title",
            label: "Title",
            controller: quizTitleController,
          ),
          Gap(AppPaddings.bigPadding),

          /// Choose category button
          _ChooseQuizCategoryButton(),
          Gap(AppPaddings.bigPadding),

          /// Description field
          QuizNameField(
            context,
            expands: true,
            label: "Description",
            hintText: "Enter quiz description",
            controller: quizDescController,
          ),
        ],
      ),
    );
  }
}

class _ChooseQuizCategoryButton extends StatefulWidget {
  const _ChooseQuizCategoryButton();

  @override
  State<_ChooseQuizCategoryButton> createState() =>
      _ChooseQuizCategoryButtonState();
}

class _ChooseQuizCategoryButtonState extends State<_ChooseQuizCategoryButton> {
  final String title = "Quiz Category";

  String hintText = "Choose quiz category";
  Categories? selectedCategory;

  void onPressed() {
    /// push [ChooseCategoryPage] and send [selectedCategory]
    context
        .pushNamed(
      ChooseCategoryPage.route,
      arguments: selectedCategory,
    )
        .then((category) {
      /// If category received from [ChooseCategoryPage]
      /// set the hintText to category name
      setState(
        () {
          /// I used try and cath block because the category may be null.
          /// if it is null nothing will happen.
          try {
            category as Categories;
            selectedCategory = category;
            hintText = category.name.toString();
          } catch (e) {}
        },
      );
    });
  }

  ButtonStyle get buttonStyle => OutlinedButton.styleFrom(
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
      );
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                title,
                style: context.textTheme.labelMedium?.copyWith(
                  color: Colors.black,
                ),
              ),
              Gap(AppPaddings.smallPadding),

              /// Button
              OutlinedButton(
                onPressed: onPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Button text
                    Text(
                      hintText,
                      style: context.textTheme.labelSmall,
                    ),

                    /// Arrow Icon
                    Icon(Icons.chevron_right_sharp),
                  ],
                ),
                style: buttonStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}
