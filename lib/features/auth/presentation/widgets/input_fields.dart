// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:trivia/core/extensions/context_extension.dart';

import '../../../../core/constants/app_border_radius.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_paddings.dart';
import '../../../../core/shared/widgets/base_text_field.dart';

class PasswordTextField extends BaseTextFormField {
  PasswordTextField(
    super.context, {
    super.key,
    super.controller,
    super.focusNode,
    super.onTapOutside,
    super.validator,
    super.textInputAction,
  });
  final String _label = "Password";
  final String _hintText = "Your password";

  bool _isObscured = true;

  @override
  bool? get obscureText => _isObscured;

  void _onTap(setState) {
    setState(
      () {
        _isObscured = !_isObscured;
      },
    );
  }

  @override
  FormFieldBuilder<String> get builder => (_) => StatefulBuilder(
        builder: (_, setState) => TextFormField(
          autofillHints: autofillHints ?? [],
          controller: controller,
          textInputAction: textInputAction ?? TextInputAction.done,
          keyboardType: keyboardType,
          validator: validator,
          obscureText: obscureText ?? false,
          autovalidateMode: autovalidateMode,
          decoration: decoration?.copyWith(
            label: Padding(
              padding: AppPaddings().textFieldLabelPadding,
              child: Text(_label),
            ),
            border: OutlineInputBorder(
              borderRadius: AppBorderRadius().inputBorderRadius,
              borderSide: BorderSide.none,
            ),
            prefixIcon: _isObscured
                ? const Icon(
                    Icons.lock_outline,
                  )
                : const Icon(Icons.lock_open_outlined),
            fillColor: Colors.white,
            hintText: _hintText,
            alignLabelWithHint: false,
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            contentPadding: AppPaddings().textFieldContentPadding,
            labelStyle: context.textTheme.labelLarge,
            hintStyle: context.textTheme.labelSmall,
            prefixIconColor: AppColors().iconColor,
            suffixIconColor: const Color(0xffcccccc),
            suffixIcon: GestureDetector(
              onTap: () => _onTap(setState),
              child: const Icon(
                Icons.remove_red_eye_outlined,
              ),
            ),
          ),
        ),
      );

  @override
  InputDecoration? get decoration => const InputDecoration();
}

class EmailField extends BaseTextFormField {
  final String _label = "Email Address";
  final String _hintText = "Your email address";

  EmailField(
    super.context, {
    super.key,
    super.controller,
    super.validator,
    super.textInputAction,
  });
  @override
  TextInputType? get keyboardType => TextInputType.emailAddress;
  @override
  Iterable<String>? get autofillHints => [AutofillHints.email];
  @override
  InputDecoration? get decoration => InputDecoration(
        label: Padding(
          padding: AppPaddings().textFieldLabelPadding,
          child: Text(_label),
        ),
        border: OutlineInputBorder(
          borderRadius: AppBorderRadius().inputBorderRadius,
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(
          Icons.email_outlined,
        ),
        fillColor: Colors.white,
        hintText: _hintText,
      );
}


// class Base implements TextFormField{
//   @override
//   // TODO: implement autovalidateMode
//   AutovalidateMode get autovalidateMode => throw UnimplementedError();

//   @override
//   // TODO: implement builder
//   FormFieldBuilder<String> get builder => throw UnimplementedError();

//   @override
//   // TODO: implement controller
//   TextEditingController? get controller => throw UnimplementedError();

//   @override
//   StatefulElement createElement() {
//     // TODO: implement createElement
//     throw UnimplementedError();
//   }

//   @override
//   FormFieldState<String> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }

//   @override
//   List<DiagnosticsNode> debugDescribeChildren() {
//     // TODO: implement debugDescribeChildren
//     throw UnimplementedError();
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     // TODO: implement debugFillProperties
//   }

//   @override
//   // TODO: implement enabled
//   bool get enabled => throw UnimplementedError();

//   @override
//   // TODO: implement initialValue
//   String? get initialValue => throw UnimplementedError();

//   @override
//   // TODO: implement key
//   Key? get key => throw UnimplementedError();

//   @override
//   // TODO: implement onChanged
//   ValueChanged<String>? get onChanged => throw UnimplementedError();

//   @override
//   // TODO: implement onSaved
//   FormFieldSetter<String>? get onSaved => throw UnimplementedError();

//   @override
//   // TODO: implement restorationId
//   String? get restorationId => throw UnimplementedError();

//   @override
//   DiagnosticsNode toDiagnosticsNode({String? name, DiagnosticsTreeStyle? style}) {
//     // TODO: implement toDiagnosticsNode
//     throw UnimplementedError();
//   }

//   @override
//   String toStringDeep({String prefixLineOne = '', String? prefixOtherLines, DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
//     // TODO: implement toStringDeep
//     throw UnimplementedError();
//   }

//   @override
//   String toStringShallow({String joiner = ', ', DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
//     // TODO: implement toStringShallow
//     throw UnimplementedError();
//   }

//   @override
//   String toStringShort() {
//     // TODO: implement toStringShort
//     throw UnimplementedError();
//   }

//   @override
//   // TODO: implement validator
//   FormFieldValidator<String>? get validator => throw UnimplementedError();
// }
