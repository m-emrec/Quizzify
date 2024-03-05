// ignore_for_file: public_member_api_docs, sort_constructors_first
part of add_question_page;

class _AddQuestionBody extends StatelessWidget {
  final TextEditingController durationValue;

  final TextEditingController questionTypeValue;

  const _AddQuestionBody({
    Key? key,
    required this.tabController,
    required this.tabLength,
    required this.themeData,
    required this.durationValue,
    required this.questionTypeValue,
  }) : super(key: key);
  final TabController tabController;
  final int tabLength;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      controller: tabController,
      children: List.generate(
        tabLength,
        (index) => Column(
          children: [
            // Cover Image
            AddCoverImageContainer(
              aspectRatio: 19 / 12,
            ),

            Gap(AppPaddings.mediumPadding),

            // Duration and question type row
            Theme(
              data: themeData,
              child: _DurationAndQuestionTypeRow(
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

            /// TODO : Here there will be a blocbuilder and swtich case
            // Answers grid
            _MultipleAnswersGrid(),
          ],
        ),
      ),
    );
  }
}
