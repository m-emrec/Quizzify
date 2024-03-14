part of overview_page;

class _QuestionTile extends StatelessWidget {
  const _QuestionTile({
    Key? key,
    required this.index,
    this.title,
    this.questionType,
    this.url,
  }) : super(key: key);
  final int index;
  final String? title;
  final QuestionType? questionType;
  final String? url;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      /// Question Index
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text(
          "${index + 1}",
          style: context.textTheme.labelLarge?.copyWith(
            color: AppColors.elevatedButtonColor,
          ),
        ),
      ),

      /// question title
      title: Text(
        title ?? "",
        style: context.textTheme.labelLarge?.copyWith(
          fontSize: 14,
        ),
      ),

      /// question type
      subtitle: Text(
        questionType?.text ?? "",
        style: context.textTheme.labelSmall?.copyWith(fontSize: 12),
      ),

      /// Question Type image
      trailing: ClipRRect(
        borderRadius: BorderRadius.circular(AppPaddings.mediumPadding),
        child: Image(
          image: AssetImage(
            url ?? "",
          ),
          errorBuilder: (context, error, stackTrace) {
            return Card();
          },
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
              child,
        ),
      ),
    );
  }
}
