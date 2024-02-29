part of add_question_page;

class _MultipleAnswersGrid extends StatelessWidget {
  List<Widget> _items(BuildContext context) => List.generate(
        4,
        (index) => _AddAnswerGridTile(
          key: ValueKey(
            index,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AnswersGrid(items: _items(context));
  }
}

class _AddAnswerDialog extends StatefulWidget {
  const _AddAnswerDialog({
    required this.controller,
    required this.valueKey,
    required this.setAnswer,
  });
  final TextEditingController controller;
  final ValueKey<Map<String, dynamic>> valueKey;
  final void Function() setAnswer;
  @override
  State<_AddAnswerDialog> createState() => _AddAnswerDialogState();
}

class _AddAnswerDialogState extends State<_AddAnswerDialog> {
  bool _isCorrectAnswer = false;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        if (widget.controller.text.isNotEmpty) {
          widget.setAnswer();
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(AppPaddings.smallPadding),
        child: Center(
          child: SizedBox(
            width: double.maxFinite,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppBorderRadius.bigBorderRadius,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPaddings.bigPadding,
                  horizontal: AppPaddings.bigPadding,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Answer",
                      style: context.textTheme.labelMedium?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    Gap(AppPaddings.smallPadding),

                    /// Add answer textfield
                    QuizNameField(
                      context,
                      controller: widget.controller,
                      hintText: "Add answer",
                      prefix: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            color: AppColors.scaffoldColor,
                            borderRadius: BorderRadius.circular(
                                AppBorderRadius.smallBorderRadius),
                            border: Border.all(
                              color: AppColors.elevatedButtonColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(AppPaddings.smallPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Correct Answer",
                          style: context.textTheme.labelMedium?.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Switch(
                          value: _isCorrectAnswer,
                          onChanged: (newVal) {
                            setState(
                              () {
                                _isCorrectAnswer = newVal;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AddAnswerGridTile extends StatefulWidget {
  const _AddAnswerGridTile({
    required this.key,
  });

  final ValueKey key;

  @override
  State<_AddAnswerGridTile> createState() => _AddAnswerGridTileState();
}

class _AddAnswerGridTileState extends State<_AddAnswerGridTile> {
  void ShowAddAnswerPopUp(BuildContext context,
      TextEditingController controller, ValueKey<Map<String, dynamic>> value) {
    showDialog(
      context: context,
      barrierLabel: "",
      builder: (context) {
        return _AddAnswerDialog(
          controller: controller,
          valueKey: value,
          setAnswer: setAnswer,
        );
      },
    );
  }

  void setAnswer() {
    setState(() {
      values.value.update("isCorrect", (value) => false);
      values.value.update("answer", (value) => _controller.text);
    });
    logger.d(values.value["answer"]);
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _controllerListener());
  }

  void _controllerListener() {
    // logger.i(_controller.text);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(() {});
    _controller.dispose();
  }

  final String _buttonLabel = "Add answer";

  TextEditingController _controller = TextEditingController();
  ValueKey<Map<String, dynamic>> values = ValueKey<Map<String, dynamic>>({
    "isCorrect": false,
    "answer": "",
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(AppBorderRadius.mediumBorderRadius),
      child: Material(
        elevation: 1,
        color: AppColors.scaffoldColor,
        child: InkWell(
          onTap: () => ShowAddAnswerPopUp(context, _controller, values),
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
  }
}
