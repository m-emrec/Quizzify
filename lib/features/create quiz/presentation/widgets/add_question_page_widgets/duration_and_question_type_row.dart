part of add_question_page;

class _DurationAndQuestionTypeRow extends StatelessWidget {
  const _DurationAndQuestionTypeRow({
    required this.initialDurationValue,
    required this.initialQuestionTypeValue,
  });

  final TextEditingController initialQuestionTypeValue;
  final TextEditingController initialDurationValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Duration
        dropDownButton(
          context,
          icon: Icons.access_time,
          size: 0.3,
          controller: initialDurationValue,
          items: _durationDropDownItems,
        ),

        /// Question Type
        dropDownButton(
          context,
          size: 0.4,
          icon: Icons.keyboard_arrow_down_outlined,
          controller: initialQuestionTypeValue,
          items: _questionTypeDropDownItems,
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> get _durationDropDownItems => List.generate(
        6,
        (index) => DropdownMenuItem(
          child: Text("${(index + 1) * 10} sec"),
          value: "${(index + 1) * 10}",
        ),
      );
  List<DropdownMenuItem<String>> get _questionTypeDropDownItems =>
      List.generate(
        QuestionType.values.length,
        (index) => DropdownMenuItem(
          child: FittedBox(
            child: Text(QuestionType.values[index].text),
          ),
          value: QuestionType.values[index].name,
        ),
      );

  SizedBox dropDownButton(
    BuildContext context, {
    required double size,
    required TextEditingController controller,
    required IconData icon,
    required List<DropdownMenuItem<String>>? items,
  }) {
    return SizedBox(
      height: 40,
      width: context.dynamicWidth(size),
      child: DropdownButtonFormField(
        isExpanded: true,
        value: controller.text,
        elevation: 3,
        style: context.textTheme.labelMedium,
        icon: Icon(
          icon,
          color: AppColors.elevatedButtonColor,
          size: 20,
        ),
        items: items,
        onChanged: (val) {
          controller.text = val.toString();
        },
      ),
    );
  }
}
