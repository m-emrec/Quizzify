part of create_quiz_page;

class _QuizForm extends StatelessWidget {
  const _QuizForm({
    required this.quizTitleController,
    required this.quizDescController,
    required this.formKey,
  });
  final TextEditingController quizTitleController;
  final TextEditingController quizDescController;
  final GlobalKey<FormState> formKey;

  final String _descriptionFieldLabel = "Description";
  final String _descriptionFieldHintText = "Enter quiz description";
  final String _titleFieldHintText = "Enter quiz title";
  final String _titleFieldLabel = "Title";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          /// QuizTitle field
          QuizNameField(
            context,
            hintText: _titleFieldHintText,
            label: _titleFieldLabel,
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
            label: _descriptionFieldLabel,
            hintText: _descriptionFieldHintText,
            controller: quizDescController,
          ),
        ],
      ),
    );
  }
}
