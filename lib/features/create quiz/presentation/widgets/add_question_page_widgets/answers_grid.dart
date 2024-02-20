part of add_question_page;

class _AnswersGrid extends StatelessWidget {
  const _AnswersGrid();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppPaddings.bigPadding),
        child: GridView.builder(
          // physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 3,
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
                        Icon(Icons.add),
                        Text("data"),
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
