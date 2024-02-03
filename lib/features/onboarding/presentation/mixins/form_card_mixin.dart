import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:trivia/features/onboarding/presentation/bloc/onboarding_bloc.dart';

mixin FormCardMixin {
  final GetIt sl = GetIt.instance;
  void onPressed(GlobalKey<FormState> formKey, String name) {
    final OnboardingBloc bloc = sl<OnboardingBloc>();
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        bloc.add(OnboardingSetNameEvent(name: name));
      }
    }
  }

  String? validator(String val) {
    if (!val.startsWith(" ") && val.length > 3) {
      return null;
    }
    return "Please provide valid name!";
  }
}
