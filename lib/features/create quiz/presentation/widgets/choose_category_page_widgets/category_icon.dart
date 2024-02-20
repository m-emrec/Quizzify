part of choose_category_page;

class _CategoryIcon extends StatelessWidget {
  const _CategoryIcon({
    required this.iconLink,
    this.iconColor,
    this.iconCardColor,
  });

  final String iconLink;
  final Color? iconColor;
  final Color? iconCardColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: iconCardColor,
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(AppPaddings.smallPadding),
        child: Iconify(
          iconLink,
          color: iconColor,
          size: 32,
        ),
      ),
    );
  }
}
