import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_paddings.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/empty_padding_extension.dart';
import '../../../../core/shared/widgets/snackbars/custom_snackbar.dart';
import '../../../../logger.dart';
import '../bloc/onboarding_bloc.dart';
import '../mixins/onboarding_mixin.dart';
import '../widgets/form_card.dart';
import '../widgets/onboarding_slider.dart';

class Onboarding extends StatefulWidget {
  static const route = "onboarding";
  const Onboarding({super.key, this.displayName});
  final String? displayName;

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with OnboardingMixin {
  /// height Onboarding slider : 0.4
  /// height  FormCard : 0.3

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingBloc, OnboardingState>(
      bloc: bloc,
      listenWhen: (previous, current) => current is OnboardingActionState,
      listener: (context, state) {
        logger.i(state);
        switch (state.runtimeType) {
          case OnboardingSuccessState:
            logger.i("Success");
            state as OnboardingSuccessState;
            state.afterSuccess!(context);
            break;
          case OnboardingFailedState:
            state as OnboardingFailedState;
            context.showSnack(ErrorSnack(
              context,
              text: state.exception,
            ));
            break;
          default:
        }
      },
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
            systemNavigationBarColor: AppColors.elevatedButtonColor,
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
                  //Card
                  FormCard(
                    title: titles[pageIndex],
                    index: pageIndex,
                    formKey: formKey,
                    controller: controller,
                    bloc: bloc,
                  ),
                  32.ph,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
