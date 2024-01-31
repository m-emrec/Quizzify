import 'package:flutter/material.dart';
import 'package:trivia/core/extensions/context_extension.dart';

abstract class Snack extends SnackBar {
  const Snack(
    this.context, {
    this.text,
    super.key,
    super.content = const SizedBox(),
  });
  final BuildContext context;
  final String? text;
  @override
  Widget get content => Text(
        text ?? "",
        style: context.textTheme.labelMedium?.copyWith(
          color: Colors.white,
        ),
      );
  @override
  SnackBarBehavior? get behavior => SnackBarBehavior.floating;
  @override
  DismissDirection get dismissDirection => DismissDirection.horizontal;
}

class ErrorSnack extends Snack {
  const ErrorSnack(
    super.context, {
    super.key,
    super.text,
  });
  @override
  Color? get backgroundColor => Colors.red.shade600;
}

class SuccessSnack extends Snack {
  const SuccessSnack(
    super.context, {
    super.key,
    super.text,
  });

  @override
  Color? get backgroundColor => Colors.green.shade600;
}


/// class a implements SnackBar{
//   @override
//   // TODO: implement action
//   SnackBarAction? get action => throw UnimplementedError();

//   @override
//   // TODO: implement actionOverflowThreshold
//   double? get actionOverflowThreshold => throw UnimplementedError();

//   @override
//   // TODO: implement animation
//   Animation<double>? get animation => throw UnimplementedError();

//   @override
//   // TODO: implement backgroundColor
//   Color? get backgroundColor => throw UnimplementedError();

//   @override
//   // TODO: implement behavior
//   SnackBarBehavior? get behavior => throw UnimplementedError();

//   @override
//   // TODO: implement clipBehavior
//   Clip get clipBehavior => throw UnimplementedError();

//   @override
//   // TODO: implement closeIconColor
//   Color? get closeIconColor => throw UnimplementedError();

//   @override
//   // TODO: implement content
//   Widget get content => throw UnimplementedError();

//   @override
//   StatefulElement createElement() {
//     // TODO: implement createElement
//     throw UnimplementedError();
//   }

//   @override
//   State<SnackBar> createState() {
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
//   // TODO: implement dismissDirection
//   DismissDirection get dismissDirection => throw UnimplementedError();

//   @override
//   // TODO: implement duration
//   Duration get duration => throw UnimplementedError();

//   @override
//   // TODO: implement elevation
//   double? get elevation => throw UnimplementedError();

//   @override
//   // TODO: implement hitTestBehavior
//   HitTestBehavior? get hitTestBehavior => throw UnimplementedError();

//   @override
//   // TODO: implement key
//   Key? get key => throw UnimplementedError();

//   @override
//   // TODO: implement margin
//   EdgeInsetsGeometry? get margin => throw UnimplementedError();

//   @override
//   // TODO: implement onVisible
//   VoidCallback? get onVisible => throw UnimplementedError();

//   @override
//   // TODO: implement padding
//   EdgeInsetsGeometry? get padding => throw UnimplementedError();

//   @override
//   // TODO: implement shape
//   ShapeBorder? get shape => throw UnimplementedError();

//   @override
//   // TODO: implement showCloseIcon
//   bool? get showCloseIcon => throw UnimplementedError();

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
//   // TODO: implement width
//   double? get width => throw UnimplementedError();

//   @override
//   SnackBar withAnimation(Animation<double> newAnimation, {Key? fallbackKey}) {
//     // TODO: implement withAnimation
//     throw UnimplementedError();
//   }
// }