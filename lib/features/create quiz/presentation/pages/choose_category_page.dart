import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:trivia/core/constants/app_border_radius.dart';
import 'package:trivia/core/constants/app_paddings.dart';
import 'package:trivia/core/constants/enums/firestore_enums.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/core/extensions/navigation_extension.dart';
import 'package:trivia/features/create%20quiz/presentation/widgets/create_quiz_base_view.dart';

import '../../../../core/constants/app_color.dart';

class ChooseCategoryPage extends StatelessWidget {
  static const route = "choose-category";
  const ChooseCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateQuizBaseView(
      showActions: false,
      onFloatingActionButtonPressed: () => context.navigator.pop("asd"),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 64.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppPaddings.mediumPadding,
            mainAxisSpacing: AppPaddings.mediumPadding,
            childAspectRatio: 16 / 14,
          ),
          itemCount: Categories.values.length,
          itemBuilder: (context, index) {
            return _CategoryCard(
              category: Categories.values[index],
              chosenIndex: 0,
              onTap: () => {},
            );
          },
        ),
      ),
      floatingActionButtonLabel: "Next",
      appBarTitle: "Choose Category",
    );
  }
}

class _CategoryCard extends StatefulWidget {
  const _CategoryCard({
    required this.category,
    required this.chosenIndex,
    this.onTap,
  });
  final Categories category;
  final int chosenIndex;
  final void Function()? onTap;

  @override
  State<_CategoryCard> createState() => __CategoryCardState();
}

class __CategoryCardState extends State<_CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(AppBorderRadius.mediumBorderRadius),
      child: Material(
        elevation: 1,
        color: AppColors.scaffoldColor,
        child: InkWell(
          onTap: widget.onTap,
          child: Card(
            color: Colors.transparent,
            elevation: 0,
            margin: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _CategoryIcon(
                  iconLink: widget.category.iconLink,
                ),
                Gap(AppPaddings.mediumPadding),
                Text(
                  widget.category.name,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: AppColors.elevatedButtonColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryIcon extends StatelessWidget {
  const _CategoryIcon({
    required this.iconLink,
  });

  final String iconLink;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(AppPaddings.smallPadding),
        child: Iconify(
          iconLink,
          color: AppColors.elevatedButtonColor,
          size: 32,
        ),
      ),
    );
  }
}
