part of add_question_page;

mixin AddAnswerGridTileMixin on State<_AddAnswerGridTile> {
  final String _addAnswerButtonLabel = "Add answer";
  final String _editAnswerButtonLabel = "Edit answer";

  /// 600 milliseconds
  final Duration duration = Duration(milliseconds: 600);
  late Map<String, dynamic> answerData;
  late int _answerIndex;
  late TextEditingController _controller;

  bool get _isAnswerEmpty => answerData["answer"].isEmpty;

  //// Functions
  ///This function used for showing a dialog box to add answer text
  void showAddAnswerPopUp(
    BuildContext context,
    TextEditingController controller,
    Map<String, dynamic> value,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return _AddAnswerDialog(
          controller: controller,
          values: value,
          setAnswer: setAnswer,
        );
      },
    );
  }

  ///This function sets the answers
  void setAnswer(bool isCorrect, String answer) {
    setState(() {
      answerData.update("isCorrect", (value) => isCorrect);
      answerData.update("answer", (value) => answer);
    });
  }

  @override
  void initState() {
    _answerIndex = widget.answerIndex.value;

    /// define initial value for the answer
    answerData = {
      "index": _answerIndex,
      "isCorrect": false,
      "answer": "",
    };

    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
