part of overview_page;

class _OverViewPageAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;

  const _OverViewPageAppBar({
    Key? key,
    required this.title,
    this.actions,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: actions,
    );
  }
}
