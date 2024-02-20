part of add_question_page;

class _MultipleAnswersGrid extends StatelessWidget {
  final String _buttonLabel = "Add answer";
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppPaddings.bigPadding),
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 5 / 3,
            crossAxisSpacing: AppPaddings.smallPadding,
            mainAxisSpacing: AppPaddings.smallPadding,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
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
            );
          },
        ),
      ),
    );
  }
}
