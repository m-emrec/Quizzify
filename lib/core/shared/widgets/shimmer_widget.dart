import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trivia/core/constants/app_border_radius.dart';
import 'package:trivia/core/constants/app_color.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    this.height = 16,
    this.width,
    this.shape = BoxShape.rectangle,
    this.child,
  });
  final double? height;
  final double? width;
  final BoxShape shape;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Shimmer.fromColors(
          baseColor: AppColors.shimmerWidgetBaseColor,
          highlightColor: AppColors.shimmerWidgetHighlightColor,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.shimmerWidgetBaseColor,
              shape: shape,
              borderRadius: shape == BoxShape.circle
                  ? null
                  : BorderRadius.circular(AppBorderRadius.smallBorderRadius),
            ),
            height: height,
            width: width,
            child: child,
          ),
        ),
      ],
    );
  }
}
