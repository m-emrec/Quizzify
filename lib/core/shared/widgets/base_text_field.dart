import 'package:flutter/material.dart';
import 'package:trivia/core/extensions/context_extension.dart';

import '../../constants/app_color.dart';
import '../../constants/app_paddings.dart';

class BaseTextFormField extends TextFormField {
  BaseTextFormField(
    this.context, {
    super.key,
    this.autofillHints,
    this.textInputAction,
    this.keyboardType,
    this.obscureText,
    this.decoration,
    this.border,
    super.controller,
    super.autofocus,
    super.autovalidateMode,
    super.expands,
    super.initialValue,
    super.onTapOutside,
    super.focusNode,
    super.validator,
    this.hintText,
    this.suffixIcon,
    this.fillColor,
  });

  final BuildContext context;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final InputDecoration? decoration;
  final InputBorder? border;
  final String? hintText;
  final Widget? suffixIcon;
  final Color? fillColor;

  @override
  FormFieldBuilder<String> get builder => (_) => TextFormField(
        autofillHints: autofillHints,
        controller: controller,
        textInputAction: textInputAction ?? TextInputAction.done,
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscureText ?? false,
        autovalidateMode: autovalidateMode,
        decoration: decoration?.copyWith(
          alignLabelWithHint: false,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          contentPadding: AppPaddings().textFieldContentPadding,
          labelStyle: context.textTheme.labelLarge,
          hintStyle: context.textTheme.labelSmall,
          prefixIconColor: AppColors().iconColor,
          suffixIconColor: const Color(0xffcccccc),
          border: border,
          hintText: hintText,
          suffixIcon: suffixIcon,
          fillColor: fillColor,
        ),
      );
}
