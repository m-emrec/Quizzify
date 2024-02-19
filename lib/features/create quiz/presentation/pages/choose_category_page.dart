import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:trivia/core/constants/app_border_radius.dart';
import 'package:trivia/core/constants/app_paddings.dart';
import 'package:trivia/core/constants/enums/firestore_enums.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/core/extensions/navigation_extension.dart';
import 'package:trivia/features/create%20quiz/presentation/widgets/create_quiz_base_view.dart';

import '../../../../core/constants/app_color.dart';

class ChooseCategoryPage extends StatefulWidget {
  static const route = "choose-category";
  const ChooseCategoryPage({super.key});

  @override
  State<ChooseCategoryPage> createState() => _ChooseCategoryPageState();
}

class _ChooseCategoryPageState extends State<ChooseCategoryPage> {
  late int? chosenCategory = null;

  void selectCategory(int index) {
    setState(() {
      chosenCategory = index;
    });
  }

  void sendChosenCategory(BuildContext context) {
    if (chosenCategory != null) {
      context.navigator.pop(Categories.values[chosenCategory!]);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    try {
      final arguments = ModalRoute.of(context)?.settings.arguments;
      final Categories receivedCategory = arguments as Categories;
      chosenCategory = receivedCategory.index;
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return CreateQuizBaseView(
      delete: false,
      duplicate: false,
      onFloatingActionButtonPressed:
          chosenCategory == null ? null : () => sendChosenCategory(context),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 64.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppPaddings.mediumPadding,
            mainAxisSpacing: AppPaddings.mediumPadding,
            childAspectRatio: 16 / 14,
          ),
          itemCount: Categories.values.length,
          itemBuilder: (context, index) {
            return _CategoryCard(
              category: Categories.values[index],
              chosenIndex: chosenCategory,
              onTap: selectCategory,
            );
          },
        ),
      ),
      floatingActionButtonLabel: "Next",
      appBarTitle: "Choose Category",
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.category,
    this.chosenIndex,
    this.onTap,
  });
  final Categories category;
  final int? chosenIndex;
  final void Function(int)? onTap;

  bool get _isChosen => chosenIndex == category.index;

  final Color selectedIconAndTextColor = Colors.white;

  Color get selectedCardColor => Color(0xffFF8FA2);

  Color get selectedIconCardColor => Color(0xffFFA5B5);

  final Color unSelectedIconAndTextColor = AppColors.elevatedButtonColor;

  final Color unSelectedCardColor = AppColors.scaffoldColor;

  final Color unSelectedIconCardColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(AppBorderRadius.mediumBorderRadius),
      child: Material(
        elevation: 1,
        color: _isChosen ? selectedCardColor : unSelectedCardColor,
        child: InkWell(
          onTap: () => onTap!(category.index),
          child: Card(
            color: Colors.transparent,
            elevation: 0,
            margin: EdgeInsets.zero,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _CategoryIcon(
                  iconLink: category.iconLink,
                  iconColor: _isChosen
                      ? selectedIconAndTextColor
                      : unSelectedIconAndTextColor,
                  iconCardColor: _isChosen
                      ? selectedIconCardColor
                      : unSelectedIconCardColor,
                ),
                Gap(AppPaddings.smallPadding),
                Text(
                  category.name,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: _isChosen
                        ? selectedIconAndTextColor
                        : unSelectedIconAndTextColor,
                  ),
                ),
                Text(
                  "21 Quizzes",
                  style: context.textTheme.labelSmall?.copyWith(
                    color: _isChosen
                        ? selectedIconAndTextColor
                        : unSelectedIconAndTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryIcon extends StatelessWidget {
  const _CategoryIcon({
    required this.iconLink,
    this.iconColor,
    this.iconCardColor,
  });

  final String iconLink;
  final Color? iconColor;
  final Color? iconCardColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: iconCardColor,
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(AppPaddings.smallPadding),
        child: Iconify(
          iconLink,
          color: iconColor,
          size: 32,
        ),
      ),
    );
  }
}
