import 'package:flutter/material.dart';
import '../bloc/onboarding_bloc.dart';

mixin FormCardMixin {
  void onPressed(
      GlobalKey<FormState> formKey, String name, OnboardingBloc bloc) {
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
