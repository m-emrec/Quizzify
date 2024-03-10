import 'package:flutter/material.dart';

import '../../../../core/constants/app_border_radius.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/enums/app_paddings.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/empty_padding_extension.dart';
import '../../../../core/utils/shared/widgets/shimmer_widget.dart';
import '../../data/models/recent_quiz_model.dart';
import '../mixins/recent_quiz_card_mixin.dart';
import 'bloc_widget_manager.dart';

class RecentQuizCard extends StatefulWidget {
  const RecentQuizCard({
    super.key,
  });

  @override
  State<RecentQuizCard> createState() => _RecentQuizCardState();
}

class _RecentQuizCardState extends State<RecentQuizCard>
    with RecentQuizCardMixin {
  @override
  Widget build(BuildContext context) {
    return BlocWidgetManager<RecentQuizModel>(
      bloc: bloc,
      loadingWidget: _LoadingRecentQuizCard(),
      loadedWidget: (_) => _LoadedRecentQuizCard(
        onTap: onTap,
        recentQuizCategoryIcon: Icons.headphones,
        recentQuizName: "Quiz Name",
      ),
    );
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
