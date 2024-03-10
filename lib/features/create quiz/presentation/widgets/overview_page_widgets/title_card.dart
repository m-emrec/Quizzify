part of overview_page;

class _TitleCard extends StatelessWidget {
  const _TitleCard();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(1),
      child: ClipPath(
        clipper: _TitleCardClipper(radius: 30),
        child: Card(
          color: context.theme.cardColor,
          surfaceTintColor: context.theme.cardColor,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppBorderRadius.mediumBorderRadius +
                  AppBorderRadius.smallBorderRadius,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppPaddings.mediumPadding + AppPaddings.smallPadding,
              horizontal: AppPaddings.mediumPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Category + number of questions  Edit button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Label
                    Chip(
                      avatar: Iconify(Categories.Tech.iconLink),
                      label: Row(
                        children: [
                          Text(
                            "TECH ",
                            style: context.textTheme.labelMedium?.copyWith(
                              color: AppColors.elevatedButtonColor,
                              fontSize: 12,
                            ),
                          ),
                          CircleAvatar(
                            radius: 2,
                            backgroundColor: AppColors.elevatedButtonColor,
                          ),
                          Text(
                            " 5 QUIZZES",
                            style: context.textTheme.labelMedium?.copyWith(
                              color: AppColors.elevatedButtonColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      backgroundColor: AppColors.scaffoldColor,
                      side: BorderSide.none,
                    ),
                    // Edit button
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit_outlined),
                    )
                  ],
                ),

                /// Gap
                Gap(AppPaddings.mediumPadding),

                ///title
                Text(
                  "Remote Work Tools Quiz",
                  style: context.textTheme.labelLarge,
                ),

                /// description
                Text(
                  "Take this basic remote work tools quiz to test your tech knowledge.",
                  style: context.textTheme.labelSmall,
                ),

                /// Gap
                Gap(AppPaddings.smallPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TitleCardClipper extends CustomClipper<Path> {
  final double radius;

  _TitleCardClipper({required this.radius});
  @override
  Path getClip(Size size) {
    final double height = size.height;
    final double width = size.width;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, height)
      ..lineTo(width / 2 - radius * 1.3, height)
      ..quadraticBezierTo(
          width / 2, height - radius, width / 2 + radius * 1.3, height)
      ..lineTo(width, height)
      ..lineTo(width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
