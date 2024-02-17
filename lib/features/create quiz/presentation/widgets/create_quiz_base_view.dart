// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import 'package:trivia/core/constants/app_border_radius.dart';
import 'package:trivia/core/constants/app_color.dart';
import 'package:trivia/core/constants/app_paddings.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/core/extensions/navigation_extension.dart';
import 'package:trivia/logger.dart';

class CreateQuizBaseView extends StatefulWidget {
  CreateQuizBaseView({
    super.key,
    required this.body,
    required this.floatingActionButtonLabel,
    this.onFloatingActionButtonPressed,
    required this.appBarTitle,
    this.onDuplicateTapped,
    this.onDeleteTapped,
    this.showDuplicate = true,
    this.showActions = true,
  });
  final Widget body;
  final String floatingActionButtonLabel;
  final String appBarTitle;
  final void Function()? onFloatingActionButtonPressed;
  final void Function()? onDuplicateTapped;
  final void Function()? onDeleteTapped;
  final bool showDuplicate;
  final bool showActions;

  @override
  State<CreateQuizBaseView> createState() => _CreateQuizBaseViewState();
}

class _CreateQuizBaseViewState extends State<CreateQuizBaseView> {
  ThemeData _themeData(BuildContext context) => context.theme.copyWith(
        appBarTheme: context.theme.appBarTheme.copyWith(
          backgroundColor: AppColors.homeScaffoldColor,
          systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: AppColors.homeScaffoldColor,
            statusBarIconBrightness: Brightness.light,
          ),
          titleTextStyle: context.theme.appBarTheme.titleTextStyle?.copyWith(
            color: Colors.white,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        scaffoldBackgroundColor: AppColors.homeScaffoldColor,
      );

  final String duplicateButtonLabel = "Duplicate";

  final String deleteButtonLabel = "Delete";

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _themeData(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _FloatingActionButton(
          onPressed: widget.onFloatingActionButtonPressed,
          floatingActionButtonLabel: widget.floatingActionButtonLabel,
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: _AppBar(
            appBarTitle: widget.appBarTitle,
            duplicateButtonLabel: duplicateButtonLabel,
            deleteButtonLabel: deleteButtonLabel,
            onDeleteTapped: widget.onDeleteTapped,
            onDuplicateTapped: widget.onDuplicateTapped,
            showActions: widget.showActions,
            showDuplicate: widget.showDuplicate,
          ),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          if (context.keyboardSize > 0 && _scrollController.hasClients) {
            _scrollController.animateTo(
              context.keyboardSize / 2,
              duration: Duration(milliseconds: 400),
              curve: Curves.linear,
            );
          }
          return SingleChildScrollView(
            controller: _scrollController,
            physics: ClampingScrollPhysics(),
            child: SizedBox(
              height: constraints.maxHeight +
                  context.mediaQuery.viewInsets.bottom / 2,
              width: constraints.maxWidth,
              child: Card(
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
                  padding: AppPaddings().pageHPadding +
                      EdgeInsets.only(top: AppPaddings.mediumPadding),
                  child: widget.body,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  final String appBarTitle;

  final void Function()? onDuplicateTapped;

  final String duplicateButtonLabel;

  final void Function()? onDeleteTapped;

  final String deleteButtonLabel;
  final bool showDuplicate;
  final bool showActions;
  const _AppBar({
    Key? key,
    required this.appBarTitle,
    this.onDuplicateTapped,
    required this.duplicateButtonLabel,
    this.onDeleteTapped,
    required this.deleteButtonLabel,
    this.showDuplicate = true,
    this.showActions = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(appBarTitle),
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(
          Icons.arrow_back,
        ),
      ),
      actions: showActions
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
                    PopupMenuItem(
                      height: showDuplicate ? kMinInteractiveDimension : 0,
                      onTap: onDuplicateTapped,
                      child: showDuplicate
                          ? Row(
                              children: [
                                Icon(
                                  Icons.copy_outlined,
                                  color: context.textTheme.labelSmall?.color,
                                ),
                                Gap(8),
                                Text(
                                  duplicateButtonLabel,
                                  style: context.textTheme.labelMedium,
                                ),
                              ],
                            )
                          : null,
                    ),
                    PopupMenuItem(
                      onTap: onDeleteTapped,
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_outlined,
                            color: AppColors.dangerColor,
                          ),
                          Gap(8),
                          Text(
                            deleteButtonLabel,
                            style: context.textTheme.labelMedium?.copyWith(
                              color: AppColors.dangerColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ];
                },
              )
            ]
          : null,
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
