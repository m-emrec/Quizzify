import 'package:flutter/material.dart';
import 'package:trivia/core/extensions/context_extension.dart';

import '../../constants/app_border_radius.dart';
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
    this.decoration = const InputDecoration(),
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
    this.label,
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
  final String? label;

  final TextCapitalization textCapitalization = TextCapitalization.none;

  @override
  FormFieldBuilder<String> get builder => (_) => TextFormField(
        textCapitalization: textCapitalization,
        autofillHints: autofillHints,
        controller: controller,
        textInputAction: textInputAction ?? TextInputAction.done,
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscureText ?? false,
        autovalidateMode: autovalidateMode,
        decoration: decoration?.copyWith(
          label: Padding(
            padding: AppPaddings().textFieldLabelPadding,
            child: Text(label ?? ""),
          ),
          alignLabelWithHint: false,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          contentPadding: AppPaddings().textFieldContentPadding +
              (decoration?.contentPadding?.resolve(TextDirection.ltr) ??
                  EdgeInsets.zero),
          labelStyle: context.textTheme.labelLarge,
          hintStyle: context.textTheme.labelSmall,
          prefixIconColor: AppColors().iconColor,
          suffixIconColor: const Color(0xffcccccc),
          border: OutlineInputBorder(
            borderRadius: AppBorderRadius().inputBorderRadius,
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          suffixIcon: suffixIcon,
          fillColor: fillColor,
        ),
      );
}
