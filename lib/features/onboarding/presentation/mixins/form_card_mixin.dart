import 'package:flutter/material.dart';

mixin FormCardMixin {
  void onPressed(GlobalKey<FormState> formKey, String name) {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        ///
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
