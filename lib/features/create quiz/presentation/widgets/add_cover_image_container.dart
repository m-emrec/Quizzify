import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trivia/core/extensions/context_extension.dart';

import '../../../../core/constants/app_border_radius.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_paddings.dart';

class AddCoverImageContainer extends StatelessWidget {
  const AddCoverImageContainer({
    super.key,
  });

  final String addCoverImageText = "Add Cover Image";
  final double iconSize = 64;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 19 / 13,
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(AppBorderRadius.bigBorderRadius),
        color: AppColors.scaffoldColor,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(AppPaddings.bigPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.photo_outlined,
                  size: iconSize,
                  color: AppColors.elevatedButtonColor,
                ),
                Gap(AppPaddings.mediumPadding),
                Text(
                  addCoverImageText,
                  style: context.textTheme.labelLarge
                      ?.copyWith(color: AppColors.elevatedButtonColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
