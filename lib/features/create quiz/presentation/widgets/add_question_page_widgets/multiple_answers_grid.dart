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

  void setAnswer(bool isCorrect, String answer) {
    setState(() {
      values.value.update("isCorrect", (value) => isCorrect);
      values.value.update("answer", (value) => answer);
    });
  }

  late ValueKey<Map<String, dynamic>> values;
  late int _answerIndex;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _answerIndex = widget.key.value;
    values = ValueKey<Map<String, dynamic>>({
      "index": _answerIndex,
      "isCorrect": false,
      "answer": "",
    });

    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final String _addAnswerButtonLabel = "Add answer";
  final String _editAnswerButtonLabel = "Edit answer";

  bool get _isAnswerNull => values.value["answer"].isEmpty;
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
            child: Center(
              child: AnimatedCrossFade(
                duration: Duration(milliseconds: 250),
                crossFadeState: _isAnswerNull
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                firstChild: _addAnswerTile(context),
                secondChild: _editAnswerTile(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _editAnswerTile(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.edit_outlined,
          color: AppColors.elevatedButtonColor,
        ),
        Gap(AppPaddings.smallPadding / 2), // 4
        Text(
          _editAnswerButtonLabel,
          style: context.textTheme.labelMedium?.copyWith(
            color: AppColors.elevatedButtonColor,
          ),
        ),
      ],
    );
  }

  Column _addAnswerTile(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add,
          color: AppColors.elevatedButtonColor,
        ),
        Gap(AppPaddings.smallPadding / 2), // 4
        Text(
          _addAnswerButtonLabel,
          style: context.textTheme.labelMedium?.copyWith(
            color: AppColors.elevatedButtonColor,
          ),
        ),
      ],
    );
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
  final void Function(bool, String) setAnswer;
  @override
  State<_AddAnswerDialog> createState() => _AddAnswerDialogState();
}

class _AddAnswerDialogState extends State<_AddAnswerDialog> {
  late bool _isCorrectAnswer;
  late bool _canPop;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _isCorrectAnswer = widget.valueKey.value["isCorrect"];
    _canPop = false;

    _textEditingController = widget.controller;

    _textEditingController.addListener(listener);
  }

  void listener() {
    if (mounted) {
      if (_textEditingController.text.isNotEmpty) {
        _canPop = true;
      } else {
        _canPop = false;
      }
      setState(() {});
    }
  }

  @override
  void dispose() {
    _textEditingController.removeListener(() {});
    super.dispose();
  }

  void onPop(bool didPop) {
    if (didPop) {
      widget.setAnswer(_isCorrectAnswer, widget.controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _canPop,
      onPopInvoked: onPop,
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
                      autoFocus: true,
                      controller: _textEditingController,
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

                    /// Correct answer switch
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
