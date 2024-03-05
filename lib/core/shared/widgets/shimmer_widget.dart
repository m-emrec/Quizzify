import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../constants/app_border_radius.dart';
import '../../constants/app_color.dart';

class ShimmerWidget extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final BoxShape shape;
  const ShimmerWidget({
    super.key,
    this.child,
    this.height = 16,
    this.width,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Shimmer.fromColors(
            child: child ??
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: AppColors.shimmerWidgetBaseColor,
                    shape: shape,
                    borderRadius: shape == BoxShape.circle
                        ? null
                        : BorderRadius.circular(
                            AppBorderRadius.smallBorderRadius),
                  ),
                  height: height,
                  width: width,
                  child: child,
                ),
            baseColor: AppColors.shimmerWidgetBaseColor,
            highlightColor: AppColors.shimmerWidgetHighlightColor),
      ],
    );
  }
}
