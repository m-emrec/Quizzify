import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trivia/core/constants/app_color.dart';
import 'package:trivia/core/constants/app_paddings.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/core/extensions/empty_padding_extension.dart';
import 'package:trivia/features/onboarding/presentation/mixins/onboarding_mixin.dart';
import 'package:trivia/logger.dart';

import '../widgets/form_card.dart';
import '../widgets/onboarding_slider.dart';

class Onboarding extends StatefulWidget {
  static const route = "onboarding";
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with OnboardingMixin {
  /// height Onboarding slider : 0.4
  /// height  FormCard : 0.3
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarColor: AppColors().elevatedButtonColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: context.dynamicHeight(1),
          width: context.dynamicWidth(1),
          decoration: backgroundImage(),
          child: Padding(
            padding: AppPaddings().pageHPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Page view
                OnboardingSlider(
                  controller: pageController,
                  onPageChanged: onPageChanged,
                ),
                // 32.ph,
                //Card
                FormCard(
                  title: titles[pageIndex],
                  index: pageIndex,
                  formKey: formKey,
                  controller: controller,
                ),
                32.ph,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
