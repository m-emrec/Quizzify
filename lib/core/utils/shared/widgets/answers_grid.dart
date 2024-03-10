import 'package:flutter/material.dart';

import '../../../constants/enums/app_paddings.dart';

class AnswersGrid extends StatelessWidget {
  const AnswersGrid({
    super.key,
    required this.items,
    this.childAspectRatio = 5 / 3,
    this.crossAxisCount = 2,
  });

  final List<Widget> items;
  final double childAspectRatio;
  final int crossAxisCount;
  @override
  Widget build(BuildContext context) {
    final ScrollController _controller = ScrollController();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppPaddings.bigPadding * 2),
        child: GridView.builder(
          controller: _controller,
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            crossAxisSpacing: AppPaddings.smallPadding,
            mainAxisSpacing: AppPaddings.smallPadding,
          ),
          itemBuilder: (context, index) {
            return items[index];
          },
        ),
      ),
    );
  }
}
