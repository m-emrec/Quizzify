import 'package:flutter/material.dart';

import '../../../constants/app_border_radius.dart';
import '../../../constants/app_color.dart';
import '../../../constants/enums/app_paddings.dart';
import '../../../extensions/context_extension.dart';

class BaseTextFormField extends TextFormField {
  BaseTextFormField(
    this.context, {
    this.expands = false,
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
    super.initialValue,
    super.onTapOutside,
    this.focusNode,
    super.validator,
    this.hintText,
    this.prefix,
    this.suffixIcon,
    this.fillColor,
    this.label,
    this.autoFocus = false,
    this.onFieldSubmitted,
    super.onSaved,
    super.onEditingComplete,
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
  final bool expands;
  final TextCapitalization textCapitalization = TextCapitalization.none;
  final Widget? prefix;
  final bool autoFocus;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;

  @override
  FormFieldBuilder<String> get builder => (_) => TextFormField(
        onSaved: onSaved,
        onFieldSubmitted: onFieldSubmitted,
        onTapOutside: (event) => focusNode?.unfocus(),
        autofocus: autoFocus,
        textCapitalization: textCapitalization,
        autofillHints: autofillHints,
        controller: controller,
        textInputAction: textInputAction ?? TextInputAction.done,
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscureText ?? false,
        autovalidateMode: autovalidateMode,
        expands: expands,
        maxLines: expands ? null : 1,
        minLines: expands ? null : 1,
        decoration: decoration?.copyWith(
          label: Padding(
            padding: AppPaddings().textFieldLabelPadding,
            child: Text(label ?? ""),
          ),
          prefixIcon: prefix,
          alignLabelWithHint: false,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          contentPadding: AppPaddings().textFieldContentPadding +
              (decoration?.contentPadding?.resolve(TextDirection.ltr) ??
                  EdgeInsets.zero),
          labelStyle: context.textTheme.labelLarge,
          hintStyle: context.textTheme.labelSmall,
          prefixIconColor: AppColors.iconColor,
          suffixIconColor: const Color(0xffcccccc),
          border: decoration?.border == null
              ? OutlineInputBorder(
                  borderRadius: AppBorderRadius().inputBorderRadius,
                  borderSide: BorderSide.none,
                )
              : decoration?.border,
          hintText: hintText,
          suffixIcon: suffixIcon,
          fillColor: fillColor,
        ),
      );
}
