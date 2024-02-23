part of add_question_page;

enum _TrueFalse {
  True,
  False;
}

class _TrueFalseAnswersGrid extends StatefulWidget {
  const _TrueFalseAnswersGrid();

  @override
  State<_TrueFalseAnswersGrid> createState() => _TrueFalseAnswersGridState();
}

class _TrueFalseAnswersGridState extends State<_TrueFalseAnswersGrid>
    with SingleTickerProviderStateMixin {
  _TrueFalse? chosenIndex = null;
  void onPressed(ValueKey<_TrueFalse> key) {
    setState(() {
      chosenIndex = key.value;
    });
    _animationController.reset();
    _animationController.forward();
  }

  late AnimationController _animationController;
  Duration animationDuration = Duration(milliseconds: 300);

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: animationDuration,
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
        _Button(
          key: ValueKey(_TrueFalse.False),
          text: _TrueFalse.False.name,
          color: AppColors.dangerColor,
          controller: _animationController,
          chosenIndex: chosenIndex,
          onPressed: onPressed,
        ),
        _Button(
          key: ValueKey(_TrueFalse.True),
          text: _TrueFalse.True.name,
          color: AppColors.successColor,
          controller: _animationController,
          onPressed: onPressed,
          chosenIndex: chosenIndex,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return AnswersGrid(
      items: _items,
      childAspectRatio: 3.2,
    );
  }
}

class _Button extends StatelessWidget {
  final ValueKey<_TrueFalse> key;
  final String text;
  final Color color;
  final AnimationController controller;
  final _TrueFalse? chosenIndex;
  final Function(ValueKey<_TrueFalse> key) onPressed;
  const _Button({
    required this.key,
    required this.text,
    required this.color,
    required this.controller,
    required this.chosenIndex,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    bool _isSelected = chosenIndex == key.value;
    ;

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
      onPressed: () => onPressed(key),
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        // fit: StackFit.expand,
        children: [
          /// title
          Center(
            child: Text(
              text,
            ),
          ),

          /// Selected Icon
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
