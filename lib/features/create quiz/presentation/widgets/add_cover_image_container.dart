import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trivia/core/extensions/context_extension.dart';

import '../../../../core/constants/app_border_radius.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_paddings.dart';

class AddCoverImageContainer extends StatelessWidget {
  const AddCoverImageContainer({
    super.key,
    this.aspectRatio = 19 / 13,
  });

  final String addCoverImageText = "Add Cover Image";
  final double iconSize = 64;
  final double aspectRatio;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(AppBorderRadius.bigBorderRadius),
        color: AppColors.scaffoldColor,
        child: InkWell(
          onTap: () {},
          child: Container(
            child:

                /// TODO: add another widget here which will be shown after
                /// a Cover image chosen , get images from here:
                /// https://www.freepik.com/user/collections
                Padding(
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
      ),
    );
  }
}
