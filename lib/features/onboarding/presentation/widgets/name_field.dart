import 'package:flutter/material.dart';
import 'package:trivia/core/shared/widgets/base_text_field.dart';

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

// class a implements BaseTextFormField{
//   @override
//   // TODO: implement autofillHints
//   Iterable<String>? get autofillHints => throw UnimplementedError();

//   @override
//   // TODO: implement autovalidateMode
//   AutovalidateMode get autovalidateMode => throw UnimplementedError();

//   @override
//   // TODO: implement border
//   InputBorder? get border => throw UnimplementedError();

//   @override
//   // TODO: implement builder
//   FormFieldBuilder<String> get builder => throw UnimplementedError();

//   @override
//   // TODO: implement context
//   BuildContext get context => throw UnimplementedError();

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
//   // TODO: implement decoration
//   InputDecoration? get decoration => throw UnimplementedError();

//   @override
//   // TODO: implement enabled
//   bool get enabled => throw UnimplementedError();

//   @override
//   // TODO: implement fillColor
//   Color? get fillColor => throw UnimplementedError();

//   @override
//   // TODO: implement hintText
//   String? get hintText => throw UnimplementedError();

//   @override
//   // TODO: implement initialValue
//   String? get initialValue => throw UnimplementedError();

//   @override
//   // TODO: implement key
//   Key? get key => throw UnimplementedError();

//   @override
//   // TODO: implement keyboardType
//   TextInputType? get keyboardType => throw UnimplementedError();

//   @override
//   // TODO: implement obscureText
//   bool? get obscureText => throw UnimplementedError();

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
//   // TODO: implement suffixIcon
//   Widget? get suffixIcon => throw UnimplementedError();

//   @override
//   // TODO: implement textInputAction
//   TextInputAction? get textInputAction => throw UnimplementedError();

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
