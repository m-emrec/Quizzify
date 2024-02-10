import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trivia/core/constants/app_border_radius.dart';
import 'package:trivia/core/constants/app_color.dart';
import 'package:trivia/core/constants/app_paddings.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/core/extensions/empty_padding_extension.dart';
import 'package:trivia/features/main-view/presentation/mixins/recent_quiz_card_mixin.dart';

import '../../../../core/shared/widgets/shimmer_widget.dart';

class RecentQuizCard extends StatefulWidget {
  const RecentQuizCard({
    super.key,
  });

  @override
  State<RecentQuizCard> createState() => _RecentQuizCardState();
}

class _RecentQuizCardState extends State<RecentQuizCard>
    with RecentQuizCardMixin {
  bool _isLoaded = true;

  void onTap() {}

  @override
  Widget build(BuildContext context) {
    return _isLoaded
        ? _LoadedRecentQuizCard(
            onTap: onTap,
            recentQuizCategoryIcon: Icons.headphones,
            recentQuizName: "Quiz Name",
          )
        : _LoadingRecentQuizCard();
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
          borderRadius:
              BorderRadius.circular(AppBorderRadius.mediumBorderRadius),
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
  const _LoadedRecentQuizCard({
    this.recentQuizName,
    this.recentQuizCategoryIcon,
    this.onTap,
  });

  final String recentQuizText = "RECENT QUIZ";
  final String? recentQuizName;
  final IconData? recentQuizCategoryIcon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return _BaseRecentQuizCard(
      onTap: onTap,
      title: Text(
        recentQuizText,
        style: context.textTheme.titleSmall
            ?.copyWith(color: AppColors.recentQuizCardTitleColor),
      ),
      tileColor: AppColors.recentQuizCardTileColor,
      subtitle: [
        Icon(
          recentQuizCategoryIcon,
          color: AppColors.recentQuizCardSubTitleColor,
        ),
        4.pw,
        Text(
          recentQuizName ?? "",
          style: context.textTheme.titleMedium?.copyWith(
            color: AppColors.recentQuizCardSubTitleColor,
          ),
        ),
      ],

      /// TODO: Change this.
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
      onTap: null,
      title: ShimmerWidget(
        width: 150,
      ),
      tileColor: AppColors.shimmerWidgetBackgroundColor,
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
