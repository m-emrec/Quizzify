import 'package:flutter/material.dart';
import 'package:trivia/core/constants/app_color.dart';
import 'package:trivia/core/constants/app_paddings.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/core/extensions/empty_padding_extension.dart';

import '../../../../core/shared/widgets/shimmer_widget.dart';

class RecentQuizCard extends StatefulWidget {
  const RecentQuizCard({
    super.key,
  });

  @override
  State<RecentQuizCard> createState() => _RecentQuizCardState();
}

class _RecentQuizCardState extends State<RecentQuizCard> {
  bool _isLoaded = false;
  @override
  Widget build(BuildContext context) {
    return _isLoaded ? _LoadedRecentQuizCard() : _LoadingRecentQuizCard();
  }
}

class _BaseRecentQuizCard extends StatelessWidget {
  final Widget title;

  final Color tileColor;

  final List<Widget> subtitle;

  final Widget percent;
  final void Function()? onTap;
  const _BaseRecentQuizCard({
    required this.title,
    required this.tileColor,
    required this.subtitle,
    required this.percent,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.1),
      width: double.maxFinite,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          title: title,
          tileColor: tileColor,
          onTap: onTap,
          minVerticalPadding: 0,
          subtitle: Padding(
            padding: const EdgeInsets.only(top: AppPaddings.smallPadding),
            child: Row(
              children: subtitle,
            ),
          ),

          /// Percent done
          trailing: percent,
          contentPadding:
              EdgeInsets.symmetric(horizontal: AppPaddings.bigPadding),
        ),
      ),
    );
  }
}

class _LoadedRecentQuizCard extends StatelessWidget {
  const _LoadedRecentQuizCard();

  @override
  Widget build(BuildContext context) {
    return _BaseRecentQuizCard(
      title: Text(
        "RECENT QUIZ",
        style: context.textTheme.titleSmall
            ?.copyWith(color: AppColors.recentQuizCardTitleColor),
      ),
      tileColor: AppColors.recentQuizCardTileColor,
      subtitle: [
        Icon(
          Icons.headphones,
          color: AppColors.recentQuizCardSubTitleColor,
        ),
        4.pw,
        Text(
          "A Basic Music Quiz",
          style: context.textTheme.titleMedium?.copyWith(
            color: AppColors.recentQuizCardSubTitleColor,
          ),
        ),
      ],
      percent: Container(
        clipBehavior: Clip.antiAlias,
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          color: AppColors.recentQuizCardNotDonePercentColor,
          shape: BoxShape.circle,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              strokeAlign: 0.3,
              value: 0.65,
              strokeWidth: 64,
              color: AppColors.recentQuizCardDonePercentColor,
            ),
            // Text("65%"),
          ],
        ),
      ),
    );
  }
}

class _LoadingRecentQuizCard extends StatelessWidget {
  const _LoadingRecentQuizCard();

  @override
  Widget build(BuildContext context) {
    return _BaseRecentQuizCard(
      title: ShimmerWidget(
        width: 150,
      ),
      tileColor: AppColors.recentQuizCardTileColor,
      subtitle: [
        Expanded(
          child: ShimmerWidget(),
        )
      ],
      percent: ShimmerWidget(
        shape: BoxShape.circle,
        height: 64,
        width: 64,
      ),
    );
  }
}
