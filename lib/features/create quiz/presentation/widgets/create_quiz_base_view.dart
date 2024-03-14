import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_border_radius.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/enums/app_paddings.dart';
import '../../../../core/extensions/context_extension.dart';
import '../mixins/create_quiz_base_view_mixin.dart';

class CreateQuizBaseView extends StatefulWidget {
  CreateQuizBaseView({
    super.key,
    required this.body,
    required this.floatingActionButtonLabel,
    this.onFloatingActionButtonPressed,
    required this.appBarTitle,
    this.onDuplicateTapped,
    this.onDeleteTapped,
    this.actions,
    this.discard = true,
    this.done = true,
  });
  final Widget body;
  final String floatingActionButtonLabel;
  final String appBarTitle;
  final void Function()? onFloatingActionButtonPressed;
  final void Function()? onDuplicateTapped;
  final void Function()? onDeleteTapped;
  final List<Widget>? actions;
  final bool done;
  final bool discard;

  @override
  State<CreateQuizBaseView> createState() => _CreateQuizBaseViewState();
}

class _CreateQuizBaseViewState extends State<CreateQuizBaseView>
    with CreateQuizBaseViewMixin {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: themeData,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _FloatingActionButton(
          onPressed: widget.onFloatingActionButtonPressed,
          floatingActionButtonLabel: widget.floatingActionButtonLabel,
        ),
        // Appbar
        appBar: _CreateQuizAppBar(
          discard: widget.discard,
          save: widget.done,
          title: Text(widget.appBarTitle),
          showAction: !(widget.discard == false && widget.done == false),
        ),
        // Body
        body: LayoutBuilder(builder: (context, constraints) {
          resizeScaffold();

          return _BaseBody(
            scrollController: scrollController,
            body: widget.body,
            constraints: constraints,
          );
        }),
      ),
    );
  }
}

class _BaseBody extends StatelessWidget {
  const _BaseBody({
    required this.scrollController,
    required this.body,
    required this.constraints,
  });

  final ScrollController scrollController;
  final Widget? body;
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      physics: ClampingScrollPhysics(),
      child: SizedBox(
        height:
            constraints.maxHeight + context.mediaQuery.viewInsets.bottom / 2,
        width: constraints.maxWidth,
        child: Card(
          clipBehavior: Clip.antiAlias,
          surfaceTintColor: Colors.white,
          margin: EdgeInsets.all(AppPaddings.smallPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppBorderRadius.bigBorderRadius +
                  AppBorderRadius.smallBorderRadius,
            ),
          ),
          color: Colors.white,
          child: Padding(
            padding: AppPaddings().pageHPadding,
            child: body,
          ),
        ),
      ),
    );
  }
}

class _CreateQuizAppBar extends AppBar {
  final bool save;

  final bool discard;
  final bool showAction;

  final Function()? onDiscardTapped;

  final Function()? onSaveTapped;
  _CreateQuizAppBar({
    super.title,
    required this.save,
    required this.discard,
    required this.showAction,
    this.onDiscardTapped,
    this.onSaveTapped,
  });
  final String doneButtonLabel = "Done";

  final String discardButtonLabel = "Discard";

  @override
  ScrollNotificationPredicate get notificationPredicate =>
      super.notificationPredicate;
  @override
  List<Widget>? get actions => showAction
      ? [
          PopupMenuButton(
            position: PopupMenuPosition.under,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppBorderRadius.mediumBorderRadius),
            ),
            color: Colors.white,
            itemBuilder: (context) {
              return [
                //Delete button
                _popMenuItem(
                  context,
                  onTap: onDiscardTapped,
                  height: discard ? kMinInteractiveDimension : 0,
                  child: discard
                      ? Row(
                          children: [
                            Icon(
                              Icons.remove,
                              color: AppColors.dangerColor,
                            ),
                            Gap(8),
                            Text(
                              discardButtonLabel,
                              style: context.textTheme.labelMedium?.copyWith(
                                color: AppColors.dangerColor,
                              ),
                            ),
                          ],
                        )
                      : SizedBox(),
                ),
                //Duplicate button
                _popMenuItem(
                  context,
                  height: save ? kMinInteractiveDimension : 0,
                  onTap: onSaveTapped,
                  child: save
                      ? Row(
                          children: [
                            Icon(
                              Icons.done,
                              color: AppColors
                                  .successColor, //context.textTheme.labelSmall?.color,
                            ),
                            Gap(8),
                            Text(
                              doneButtonLabel,
                              style: context.textTheme.labelMedium
                                  ?.copyWith(color: AppColors.successColor),
                            ),
                          ],
                        )
                      : SizedBox(),
                ),
              ];
            },
          ),
        ]
      : null;

  PopupMenuItem<dynamic> _popMenuItem(
    BuildContext context, {
    Function()? onTap,
    required double height,
    required Widget? child,
  }) {
    return PopupMenuItem(
      onTap: onTap,
      height: height,
      child: child,
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton({
    required this.onPressed,
    required this.floatingActionButtonLabel,
  });

  final void Function()? onPressed;
  final String floatingActionButtonLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings().pageHPadding +
          EdgeInsets.symmetric(horizontal: AppPaddings.smallPadding),
      child: Row(
        children: [
          Expanded(
            child: FloatingActionButton.extended(
              onPressed: onPressed,
              label: Text(floatingActionButtonLabel),
            ),
          ),
        ],
      ),
    );
  }
}
