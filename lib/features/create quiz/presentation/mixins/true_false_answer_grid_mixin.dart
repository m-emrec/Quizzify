part of add_question_page;

enum _TrueFalse {
  True,
  False;
}

mixin TrueFalseAnswerGridMixin on State<_TrueFalseAnswersGrid> {
  _TrueFalse? chosenIndex = null;

  late AnimationController _animationController;
  late TickerProvider vsync;
  Duration animationDuration = Duration(milliseconds: 300);

//// Functions
  void onPressed(ValueKey<_TrueFalse> key) {
    setState(() {
      chosenIndex = key.value;
    });
    _animationController
      ..reset()
      ..forward();
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: vsync,
      duration: animationDuration,
      // I set this to 0.7 because otherwise after the animation ends check mark
      //is disappearing
      upperBound: 0.7,
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  List<Widget> get _items => [
        // false button
        _Button(
          answerIndex: ValueKey(_TrueFalse.False),
          text: _TrueFalse.False.name,
          color: AppColors.dangerColor,
          controller: _animationController,
          chosenIndex: chosenIndex,
          onPressed: onPressed,
        ),
        // true button
        _Button(
          answerIndex: ValueKey(_TrueFalse.True),
          text: _TrueFalse.True.name,
          color: AppColors.successColor,
          controller: _animationController,
          onPressed: onPressed,
          chosenIndex: chosenIndex,
        ),
      ];
}
