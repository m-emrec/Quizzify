part of create_quiz_page;

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
