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

  ThemeData get _themeData => context.theme.copyWith(
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
      );

  TextEditingController durationValue = TextEditingController(text: "10");
  TextEditingController questionTypeValue =
      TextEditingController(text: QuestionType.multiChoice.name);
}
