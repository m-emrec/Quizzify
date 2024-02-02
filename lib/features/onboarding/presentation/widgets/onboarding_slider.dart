import 'package:flutter/material.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/core/extensions/image_extension.dart';

class OnboardingSlider extends StatelessWidget {
  final PageController controller;
  final void Function(int)? onPageChanged;
  OnboardingSlider({
    super.key,
    required this.controller,
    this.onPageChanged,
  });

  final List<Widget> _pages = [
    Image.asset("onboarding1".toPng),
    Image.asset("onboarding2".toPng),
    Image.asset("onboarding3".toPng),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.dynamicHeight(0.4),
          width: context.dynamicWidth(0.9),
          child: PageView(
            clipBehavior: Clip.none,
            controller: controller,
            onPageChanged: onPageChanged,
            children: _pages,
          ),
        ),

        /// Indicator
      ],
    );
  }
}
