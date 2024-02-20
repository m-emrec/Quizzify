library add_question_page;

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_border_radius.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_paddings.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../logger.dart';
import '../widgets/add_cover_image_container.dart';
import '../widgets/create_quiz_base_view.dart';
import '../widgets/quiz_name_field.dart';

part '../widgets/add_question_page_widgets/answers_grid.dart';
part '../widgets/add_question_page_widgets/duration_and_question_type_row.dart';
part '../widgets/add_question_page_widgets/question_number_row.dart';
part '../mixins/add_question_page_mixin.dart';

enum _QuestionType {
  multiple_choice("Multiple choice"),
  true_false("True / False");

  final String text;

  const _QuestionType(this.text);
}

class AddQuestionPage extends StatefulWidget {
  static const route = "add-question";
  const AddQuestionPage({super.key});

  @override
  State<AddQuestionPage> createState() => _AddQuestionPageState();
}

class _AddQuestionPageState extends State<AddQuestionPage>
    with AddQuestionPageMixin {
  @override
  Widget build(BuildContext context) {
    return CreateQuizBaseView(
      onFloatingActionButtonPressed: () => logger.i(durationValue.text),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              // Question number row
              SizedBox(
                height: constraints.maxHeight * 0.1,
                child: QuestionNumberRow(),
              ),
              // Cover Image
              AddCoverImageContainer(
                aspectRatio: 19 / 12,
              ),

              Gap(AppPaddings.mediumPadding),

              // Duration and question type row
              Theme(
                data: context.theme.copyWith(
                  inputDecorationTheme: InputDecorationTheme(
                    border: border,
                    focusedBorder: border,
                    enabledBorder: border,
                    iconColor: AppColors.elevatedButtonColor,
                    suffixIconColor: AppColors.elevatedButtonColor,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: AppPaddings.mediumPadding,
                    ),
                  ),
                  textTheme: TextTheme(
                    labelMedium: context.textTheme.labelMedium?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
                child: DurationAndQuestionTypeRow(
                  initialDurationValue: durationValue,
                  initialQuestionTypeValue: questionTypeValue,
                ),
              ),

              // Question Field
              Padding(
                padding: const EdgeInsets.only(
                  top: AppPaddings.bigPadding,
                  bottom: AppPaddings.mediumPadding,
                ),
                child: QuizNameField(
                  context,
                  label: "Add Question",
                ),
              ),

              // Answers grid
              _AnswersGrid(),
            ],
          );
        },
      ),
      floatingActionButtonLabel: floatingActionButtonLabel,
      appBarTitle: appBarTitle,
    );
  }
}
