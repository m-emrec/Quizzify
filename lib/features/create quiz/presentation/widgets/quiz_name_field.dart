import 'package:flutter/material.dart';
import 'package:trivia/core/extensions/context_extension.dart';

import '../../../../core/constants/app_border_radius.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_paddings.dart';
import '../../../../core/shared/widgets/base_text_field.dart';

class QuizNameField extends BaseTextFormField {
  QuizNameField(
    super.context, {
    super.controller,
    super.label,
    super.hintText,
    super.textInputAction,
    super.focusNode,
    super.expands,
  });

  @override
  TextCapitalization get textCapitalization => TextCapitalization.words;
  @override
  InputBorder? get border => OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.scaffoldColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(AppBorderRadius.mediumBorderRadius),
        gapPadding: 0,
      );
  @override
  InputDecoration? get decoration => InputDecoration(
        constraints: BoxConstraints(
          maxHeight: context.dynamicHeight(
            0.1,
          ),
        ),
        fillColor: Colors.transparent,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        contentPadding: EdgeInsets.only(left: AppPaddings.mediumPadding),
      );
}
