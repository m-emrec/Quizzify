part of add_question_page;

class QuestionNumberRow extends StatelessWidget {
  const QuestionNumberRow();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      findChildIndexCallback: (key) {
        // logger.i(key);

        return 20;
      },
      itemCount: 100,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => CircleAvatar(
        radius: 16,
        // key: ValueKey(index + 1),
        // backgroundColor: Colors.transparent,
        child: Text("${index + 1}"),
      ),
    );
  }
}
