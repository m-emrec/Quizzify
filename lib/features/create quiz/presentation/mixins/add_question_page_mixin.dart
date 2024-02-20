part of add_question_page;

mixin AddQuestionPageMixin on State<AddQuestionPage> {
  final String floatingActionButtonLabel = "Add Question";

  final String appBarTitle = "Create Quiz";
  OutlineInputBorder get border => OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: AppColors.outlinedButtonBorderColor,
        ),
        borderRadius: BorderRadius.circular(AppBorderRadius.mediumBorderRadius),
      );

  TextEditingController durationValue = TextEditingController(text: "10");
  TextEditingController questionTypeValue =
      TextEditingController(text: _QuestionType.multiple_choice.name);
}
