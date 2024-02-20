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

  final Color selectedIconAndTextColor = Colors.white;

  Color get selectedCardColor => Color(0xffFF8FA2);

  Color get selectedIconCardColor => Color(0xffFFA5B5);

  final Color unSelectedIconAndTextColor = AppColors.elevatedButtonColor;

  final Color unSelectedCardColor = AppColors.scaffoldColor;

  final Color unSelectedIconCardColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(AppBorderRadius.mediumBorderRadius),
      child: Material(
        elevation: 1,
        color: _isChosen ? selectedCardColor : unSelectedCardColor,
        child: InkWell(
          onTap: () => onTap(category.index),
          child: Card(
            color: Colors.transparent,
            elevation: 0,
            margin: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _CategoryIcon(
                  iconLink: category.iconLink,
                  iconColor: _isChosen
                      ? selectedIconAndTextColor
                      : unSelectedIconAndTextColor,
                  iconCardColor: _isChosen
                      ? selectedIconCardColor
                      : unSelectedIconCardColor,
                ),
                Gap(AppPaddings.smallPadding),
                Text(
                  category.name,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: _isChosen
                        ? selectedIconAndTextColor
                        : unSelectedIconAndTextColor,
                  ),
                ),
                Text(
                  "21 Quizzes",
                  style: context.textTheme.labelSmall?.copyWith(
                    color: _isChosen
                        ? selectedIconAndTextColor
                        : unSelectedIconAndTextColor,
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
