part of add_question_page;

class _QuestionNumberRow extends StatefulWidget {
  const _QuestionNumberRow({
    required this.tabController,
    required this.tabLength,
  });
  final TabController tabController;
  final int tabLength;

  @override
  State<_QuestionNumberRow> createState() => _QuestionNumberRowState();
}

class _QuestionNumberRowState extends State<_QuestionNumberRow> {
  bool _isCurrentPage(int index) => widget.tabController.index == index;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: EdgeInsets.zero,
      tabAlignment: TabAlignment.center,
      isScrollable: true,
      dividerHeight: 0,
      labelPadding: EdgeInsets.zero,
      indicatorColor: Colors.transparent,
      controller: widget.tabController,
      onTap: (value) => setState(() {}),
      tabs: List.generate(
        widget.tabLength,
        (index) => Tab(
          child: CircleAvatar(
            backgroundColor:
                _isCurrentPage(index) ? Colors.black : Colors.transparent,
            child: Text(
              "${index + 1}",
              style: context.textTheme.labelMedium?.copyWith(
                color: _isCurrentPage(index) ? Colors.white : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
