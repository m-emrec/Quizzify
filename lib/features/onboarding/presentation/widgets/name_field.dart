import 'package:flutter/material.dart';
import '../../../../core/utils/shared/widgets/base_text_field.dart';

class NameField extends BaseTextFormField {
  NameField(
    super.context, {
    super.key,
    super.label,
    super.controller,
    super.validator,
  });
  @override
  InputDecoration? get decoration => const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
      );
  @override
  TextCapitalization get textCapitalization => TextCapitalization.words;

  @override
  TextInputType? get keyboardType => TextInputType.name;
}
