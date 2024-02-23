part of add_question_page;

class _MultipleAnswersGrid extends StatelessWidget {
  const _MultipleAnswersGrid();

  final String _buttonLabel = "Add answer";

  List<Widget> _items(BuildContext context) => List.generate(
        4,
        (index) => ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius:
              BorderRadius.circular(AppBorderRadius.mediumBorderRadius),
          child: Material(
            elevation: 1,
            color: AppColors.scaffoldColor,
            child: InkWell(
              onTap: () {},
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: AppColors.elevatedButtonColor,
                    ),
                    Gap(AppPaddings.smallPadding / 2), // 4
                    Text(
                      _buttonLabel,
                      style: context.textTheme.labelMedium?.copyWith(
                        color: AppColors.elevatedButtonColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AnswersGrid(items: _items(context));
  }
}
