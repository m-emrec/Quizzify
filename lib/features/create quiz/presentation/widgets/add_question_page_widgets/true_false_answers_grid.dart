part of add_question_page;

class _TrueFalseAnswersGrid extends StatefulWidget {
  const _TrueFalseAnswersGrid();

  @override
  State<_TrueFalseAnswersGrid> createState() => _TrueFalseAnswersGridState();
}

class _TrueFalseAnswersGridState extends State<_TrueFalseAnswersGrid>
    with SingleTickerProviderStateMixin, TrueFalseAnswerGridMixin {
  @override
  TickerProvider get vsync => this;
  @override
  Widget build(BuildContext context) {
    return AnswersGrid(
      items: _items,
      childAspectRatio: 3.2,
    );
  }
}

class _Button extends StatelessWidget {
  final ValueKey<_TrueFalse> answerIndex;
  final String text;
  final Color color;
  final AnimationController controller;
  final _TrueFalse? chosenIndex;
  final Function(ValueKey<_TrueFalse> key) onPressed;
  const _Button({
    required this.answerIndex,
    required this.text,
    required this.color,
    required this.controller,
    required this.chosenIndex,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    bool _isSelected = chosenIndex == answerIndex.value;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppBorderRadius.mediumBorderRadius),
        ),
        backgroundColor: color,
        foregroundColor: Colors.white,
      ),
      onPressed: () => onPressed(answerIndex),
      child: Stack(
        children: [
          /// title
          Center(
            child: Text(
              text,
            ),
          ),

          ///Animated Selected Icon
          Align(
            alignment: Alignment.centerRight,
            child: Visibility(
              visible: _isSelected,
              child: Lottie.network(
                LottieEnum.checked.link,
                controller: controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
