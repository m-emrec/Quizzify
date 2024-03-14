part of overview_page;

class _QuestionContainer extends StatelessWidget {
  const _QuestionContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: context.dynamicHeight(0.5),
      ),
      decoration: BoxDecoration(
        color: AppColors.scaffoldColor,
        borderRadius: BorderRadius.circular(
          (AppBorderRadius.mediumBorderRadius),
        ),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {
          return _QuestionTile(
            index: index,
            questionType: QuestionType.multiChoice,
            title: "Who wrote the song 'Let's Get It On' ?",
            url: Img.pngIconPath(Img.multiChoiceIcon.path),
          );
        },
      ),
    );
  }
}
