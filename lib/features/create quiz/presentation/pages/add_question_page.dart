library add_question_page;

import 'package:Quizzify/features/create%20quiz/presentation/pages/overview_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/app_border_radius.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/enums/app_paddings.dart';
import '../../../../core/constants/enums/firestore_enums.dart';
import '../../../../core/constants/enums/lottie_enums.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/navigation_extension.dart';
import '../../../../core/utils/shared/widgets/answers_grid.dart';
import '../widgets/add_cover_image_container.dart';
import '../widgets/create_quiz_base_view.dart';
import '../widgets/quiz_name_field.dart';

part '../mixins/add_answer_dialog_mixin.dart';
part '../mixins/add_answer_grid_tile_mixin.dart';
part '../mixins/add_question_page_mixin.dart';
part '../mixins/true_false_answer_grid_mixin.dart';
part '../widgets/add_question_page_widgets/add_answer_dialog.dart';
part '../widgets/add_question_page_widgets/add_answer_grid_tile.dart';
part '../widgets/add_question_page_widgets/duration_and_question_type_row.dart';
part '../widgets/add_question_page_widgets/multiple_answers_grid.dart';
part '../widgets/add_question_page_widgets/question_number_row.dart';
part '../widgets/add_question_page_widgets/true_false_answers_grid.dart';
part '../widgets/add_question_page_widgets/add_question_body.dart';

class AddQuestionPage extends StatefulWidget {
  static const route = "add-question";
  const AddQuestionPage({super.key});

  @override
  State<AddQuestionPage> createState() => _AddQuestionPageState();
}

class _AddQuestionPageState extends State<AddQuestionPage>
    with AddQuestionPageMixin, SingleTickerProviderStateMixin {
  @override
  TickerProvider get vsync => this;
  @override
  Widget build(BuildContext context) {
    return CreateQuizBaseView(
      onFloatingActionButtonPressed: () =>
          context.navigator.pushNamed(OverViewPage.route),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: AppPaddings.smallPadding),
            child: _QuestionNumberRow(
              tabController: _tabController,
              tabLength: maxQuestionNumber,
            ),
          ),
          Expanded(
            child: _AddQuestionBody(
              tabController: _tabController,
              tabLength: maxQuestionNumber,
              themeData: _themeData,
              durationValue: durationValue,
              questionTypeValue: questionTypeValue,
            ),
          ),
        ],
      ),
      floatingActionButtonLabel: floatingActionButtonLabel,
      appBarTitle: appBarTitle,
    );
  }
}
