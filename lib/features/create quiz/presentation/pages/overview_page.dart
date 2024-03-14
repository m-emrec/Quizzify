library overview_page;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

import '../../../../core/constants/app_border_radius.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/enums/app_paddings.dart';
import '../../../../core/constants/enums/firestore_enums.dart';
import '../../../../core/constants/enums/image_path_enum.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/shared/widgets/buttons/responsive_elevated_button.dart';
import '../widgets/add_cover_image_container.dart';

part "../mixins/overview_page_mixin.dart";
part "../widgets/overview_page_widgets/over_view_page_appbar.dart";
part "../widgets/overview_page_widgets/question_container.dart";
part "../widgets/overview_page_widgets/question_sheet.dart";
part "../widgets/overview_page_widgets/question_tile.dart";
part "../widgets/overview_page_widgets/title_card.dart";

class OverViewPage extends StatefulWidget {
  static const route = "overview";
  const OverViewPage({super.key});

  @override
  State<OverViewPage> createState() => _OverViewPageState();
}

class _OverViewPageState extends State<OverViewPage> with OverViewPageMixin {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _themeData(context),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: _OverViewPageAppBar(
            title: appBarTitle,
          ),
        ),
        body: Padding(
          padding: AppPaddings().pageHPadding,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// Cover Image
                /// TODO: Change it's uı with bloc
                AddCoverImageContainer(),

                // Title ,  definition , category card
                _TitleCard(),
                Gap(AppPaddings.mediumPadding),
                //Questions
                _QuestionsSheet(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
