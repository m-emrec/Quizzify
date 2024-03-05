import 'package:flutter/material.dart';

import '../../../../core/constants/enums/firestore_enums.dart';
import '../../../../core/extensions/navigation_extension.dart';
import '../pages/choose_category_page.dart';

mixin ChooseCategoryMixin on State<ChooseCategoryPage> {
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
    /// and if it is chosen then set [chosenCategory] .
    try {
      /// I use try/cath block . If there is no Category data received , this
      /// block will cause an error but because I use try/catch
      /// the app will continue to work.
      final arguments = ModalRoute.of(context)?.settings.arguments;
      final Categories receivedCategory = arguments as Categories;
      chosenCategory = receivedCategory.index;
    } catch (e) {}
  }

  bool get isCategoryChosen => chosenCategory != null;

  final String appBarTitle = "Choose Category";
  final String floatingActionButtonLabel = "Next";
}
