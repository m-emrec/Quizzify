library create_quiz_page;

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_border_radius.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_paddings.dart';
import '../../../../core/constants/enums/firestore_enums.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/navigation_extension.dart';
import '../mixins/create_quiz_page_mxin.dart';
import '../widgets/add_cover_image_container.dart';
import '../widgets/create_quiz_base_view.dart';
import '../widgets/quiz_name_field.dart';
import 'add_question_page.dart';
import 'choose_category_page.dart';

part '../widgets/create_quiz_page_widgets/choose_category_button.dart';
part '../widgets/create_quiz_page_widgets/quiz_form.dart';
part '../mixins/choose_category_button_mixin.dart';

class CreateQuizPage extends StatefulWidget {
  static const route = "create-quiz";
  const CreateQuizPage({super.key});

  @override
  State<CreateQuizPage> createState() => _CreateQuizPageState();
}

class _CreateQuizPageState extends State<CreateQuizPage>
    with CreateQuizPageMixin {
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
            /// Cover Image
            AddCoverImageContainer(),

            ///
            MaxGap(AppPaddings.bigPadding),

            /// Form
            _QuizForm(
              formKey: formKey,
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
