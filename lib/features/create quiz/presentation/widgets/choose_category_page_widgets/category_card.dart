part of choose_category_page;

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.category,
    this.chosenIndex,
    required this.onTap,
  });

  final Categories category;
  final int? chosenIndex;
  final void Function(int) onTap;

  bool get _isChosen => chosenIndex == category.index;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(AppBorderRadius.mediumBorderRadius),
      child: Material(
        elevation: 1,
        color: _isChosen
            ? _CategoryPageColors.selectedCardColor
            : _CategoryPageColors.unSelectedCardColor,
        child: InkWell(
          onTap: () => onTap(category.index),
          child: Card(
            color: Colors.transparent,
            elevation: 0,
            margin: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Category Icon
                _CategoryIcon(
                  iconLink: category.iconLink,
                  iconColor: _isChosen
                      ? _CategoryPageColors.selectedIconAndTextColor
                      : _CategoryPageColors.unSelectedIconAndTextColor,
                  iconCardColor: _isChosen
                      ? _CategoryPageColors.selectedIconCardColor
                      : _CategoryPageColors.unSelectedIconCardColor,
                ),

                /// Gap
                Gap(AppPaddings.smallPadding),

                /// Category name
                Text(
                  category.name,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: _isChosen
                        ? _CategoryPageColors.selectedIconAndTextColor
                        : _CategoryPageColors.unSelectedIconAndTextColor,
                  ),
                ),

                /// Number of quizzes belong to Category
                /// TODO: Get this from bloc
                Text(
                  "21 Quizzes",
                  style: context.textTheme.labelSmall?.copyWith(
                    color: _isChosen
                        ? _CategoryPageColors.selectedIconAndTextColor
                        : _CategoryPageColors.unSelectedIconAndTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
