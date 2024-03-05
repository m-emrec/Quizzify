part of add_question_page;

mixin AddQuestionPageMixin on State<AddQuestionPage> {
  final String floatingActionButtonLabel = "Add Question";

  final String appBarTitle = "Create Quiz";

  final PageController pageController = PageController();
  late TabController _tabController;
  late TickerProvider vsync;
  final int maxQuestionNumber = 20;

  // This controller used for storing duration from Dropdown button
  TextEditingController durationValue = TextEditingController(text: "10");
  // This controller used for storing question type from Dropdown button
  TextEditingController questionTypeValue =
      TextEditingController(text: QuestionType.multiChoice.name);

  OutlineInputBorder get _border => OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: AppColors.outlinedButtonBorderColor,
        ),
        borderRadius: BorderRadius.circular(AppBorderRadius.mediumBorderRadius),
      );

  /// for [AddQuestionPage] I had to override the main theme
  ThemeData get _themeData => context.theme.copyWith(
        inputDecorationTheme: InputDecorationTheme(
          border: _border,
          focusedBorder: _border,
          enabledBorder: _border,
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: maxQuestionNumber, vsync: vsync);
  }

  @override
  void dispose() {
    super.dispose();
    durationValue.dispose();
    questionTypeValue.dispose();
    pageController.dispose();
  }
}
