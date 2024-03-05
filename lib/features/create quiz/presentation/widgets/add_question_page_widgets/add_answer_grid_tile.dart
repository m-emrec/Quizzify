part of add_question_page;

class _AddAnswerGridTile extends StatefulWidget {
  const _AddAnswerGridTile({
    required this.answerIndex,
  });

  final ValueKey answerIndex;

  @override
  State<_AddAnswerGridTile> createState() => _AddAnswerGridTileState();
}

class _AddAnswerGridTileState extends State<_AddAnswerGridTile>
    with AddAnswerGridTileMixin {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(AppBorderRadius.mediumBorderRadius),
      child: Material(
        elevation: 1,
        color: AppColors.scaffoldColor,
        child: InkWell(
          onTap: () => showAddAnswerPopUp(context, _controller, answerData),
          child: Card(
            elevation: 0,
            margin: EdgeInsets.zero,
            color: Colors.transparent,
            child: Center(
              child: AnimatedCrossFade(
                duration: duration,
                crossFadeState: _isAnswerEmpty
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstChild: _addAnswerTile(
                  context,
                ),
                secondChild: _editAnswerTile(
                  context,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _answerTile(
    BuildContext context, {
    required IconData icon,
    required String label,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: AppColors.elevatedButtonColor,
        ),
        Gap(AppPaddings.smallPadding / 2), // 4
        Text(
          label,
          style: context.textTheme.labelMedium?.copyWith(
            color: AppColors.elevatedButtonColor,
          ),
        ),
      ],
    );
  }

  Column _addAnswerTile(BuildContext context) {
    return _answerTile(
      context,
      icon: Icons.add,
      label: _addAnswerButtonLabel,
    );
  }

  Column _editAnswerTile(BuildContext context) {
    return _answerTile(
      context,
      icon: Icons.edit_outlined,
      label: _editAnswerButtonLabel,
    );
  }
}
