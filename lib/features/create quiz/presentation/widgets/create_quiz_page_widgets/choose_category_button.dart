part of create_quiz_page;

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
