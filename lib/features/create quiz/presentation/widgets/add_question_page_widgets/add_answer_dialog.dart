part of add_question_page;

class _AddAnswerDialog extends StatefulWidget {
  const _AddAnswerDialog({
    required this.controller,
    required this.values,
    required this.setAnswer,
  });
  final TextEditingController controller;
  final Map<String, dynamic> values;
  final void Function(bool, String) setAnswer;
  @override
  State<_AddAnswerDialog> createState() => _AddAnswerDialogState();
}

class _AddAnswerDialogState extends State<_AddAnswerDialog>
    with AddAnswerDialogMixin {
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
                    // Label
                    _addAnswerInputField(context),

                    // Gap
                    Gap(AppPaddings.smallPadding),

                    /// Correct answer switch row
                    _correctAnswerSwitchRow(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _correctAnswerSwitchRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Label
        Text(
          correctAnswerText,
          style: context.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),
        // Switch
        Switch(
          value: _isCorrectAnswer,
          onChanged: (newVal) => setState(
            () {
              _isCorrectAnswer = newVal;
            },
          ),
        ),
      ],
    );
  }

  Column _addAnswerInputField(BuildContext context) {
    return Column(
      children: [
        Text(
          addAnswerText,
          style: context.textTheme.labelMedium?.copyWith(
            color: Colors.black,
          ),
        ),

        /// Gap
        Gap(AppPaddings.smallPadding),

        /// Add answer textfield
        QuizNameField(
          context,
          autoFocus: true,
          controller: _textEditingController,
          hintText: addAnswerText,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) => context.pop(),
          prefix: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: AppColors.scaffoldColor,
                borderRadius:
                    BorderRadius.circular(AppBorderRadius.smallBorderRadius),
                border: Border.all(
                  color: AppColors.elevatedButtonColor,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
