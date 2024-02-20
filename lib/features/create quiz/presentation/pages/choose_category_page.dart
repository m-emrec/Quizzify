library choose_category_page;

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

import '../../../../core/constants/app_border_radius.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_paddings.dart';
import '../../../../core/constants/enums/firestore_enums.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/navigation_extension.dart';
import '../widgets/create_quiz_base_view.dart';

part '../widgets/choose_category_page_widgets/category_card.dart';
part '../widgets/choose_category_page_widgets/category_icon.dart';

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
    /// If chosenCategory is not null pop the page and send chosenCategory
    /// to previous page
    if (chosenCategory != null) {
      context.navigator.pop(Categories.values[chosenCategory!]);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    /// Here check if there is a Category chosen before.
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
        padding: const EdgeInsets.only(bottom: 64.0) +
            EdgeInsets.only(
              top: AppPaddings.mediumPadding,
            ),
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
