part of add_question_page;

mixin AddAnswerDialogMixin on State<_AddAnswerDialog> {
  late bool _isCorrectAnswer;
  late bool _canPop;
  late TextEditingController _textEditingController;

  final String correctAnswerText = "Correct Answer";
  final String addAnswerText = "Add answer";

  @override
  void initState() {
    _isCorrectAnswer = widget.values["isCorrect"];
    _canPop = false;

    _textEditingController = widget.controller;
    listener();
    _textEditingController.addListener(() => listener());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _textEditingController.removeListener(() {});
    super.dispose();
  }

  void listener() {
    ///if widget is mounted
    if (mounted) {
      // if Answer field is not empty then allow the user to Pop the dialog .
      if (_textEditingController.text.isNotEmpty ||
          widget.values["answer"].isNotEmpty) {
        _canPop = true;
      } else {
        _canPop = false;
      }
      setState(() {});
    }
  }

  void onPop(bool didPop) {
    if (didPop) {
      widget.setAnswer(_isCorrectAnswer, widget.controller.text);
    }
  }
}
