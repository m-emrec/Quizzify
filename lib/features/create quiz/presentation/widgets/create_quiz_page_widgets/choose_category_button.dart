part of create_quiz_page;

class _ChooseQuizCategoryButton extends StatefulWidget {
  const _ChooseQuizCategoryButton();

  @override
  State<_ChooseQuizCategoryButton> createState() =>
      _ChooseQuizCategoryButtonState();
}

class _ChooseQuizCategoryButtonState extends State<_ChooseQuizCategoryButton>
    with ChooseCategoryButtonMixin {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Label
              Text(
                title,
                style: context.textTheme.labelMedium?.copyWith(
                  color: Colors.black,
                ),
              ),
              // Gap
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
