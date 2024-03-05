part of add_question_page;

class _MultipleAnswersGrid extends StatelessWidget {
  List<Widget> _items(BuildContext context) => List.generate(
        4,
        (index) => _AddAnswerGridTile(
          answerIndex: ValueKey(
            index,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AnswersGrid(items: _items(context));
  }
}
