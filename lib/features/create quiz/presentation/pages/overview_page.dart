// ignore_for_file: public_member_api_docs, sort_constructors_first
library overview_page;

import 'package:Quizzify/core/constants/enums/image_path_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

import '../../../../core/constants/app_border_radius.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/enums/app_paddings.dart';
import '../../../../core/constants/enums/firestore_enums.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utils/shared/widgets/buttons/responsive_elevated_button.dart';
import '../widgets/add_cover_image_container.dart';

part "../mixins/overview_page_mixin.dart";
part "../widgets/overview_page_widgets/over_view_page_appbar.dart";
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
            title: "Create Quiz",
            actions: [
              DropdownButton(
                items: [],
                onChanged: (_) {},
              ),
            ],
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

class _QuestionsSheet extends StatelessWidget {
  const _QuestionsSheet();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        clipBehavior: Clip.none,
        children: [
          /// Top notch
          Positioned(
            top: -16,
            left: constraints.maxWidth / 2 - 48,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 48,
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: AppColors.homeScaffoldColor,
                  ),
                ),
              ),
            ),
          ),

          ///Body
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                AppBorderRadius.mediumBorderRadius +
                    AppBorderRadius.smallBorderRadius,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppPaddings.smallPadding + AppPaddings.mediumPadding,
                horizontal: AppPaddings.mediumPadding,
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      /// Title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // title
                          Row(
                            children: [
                              Text(
                                "Questions",
                                style: context.textTheme.labelLarge,
                              ),
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: Card(
                                  color: AppColors.elevatedButtonColor,
                                  child: Center(
                                    child: Text(
                                      "5",
                                      style: context.textTheme.labelMedium
                                          ?.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),

                          // Edit button
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit_outlined),
                          )
                        ],
                      ),
                      Gap(AppPaddings.mediumPadding),

                      /// Questions
                      _QuestionContainer(),
                      Gap(AppPaddings.mediumPadding),
                    ],
                  ),

                  /// Save Button
                  Row(
                    children: [
                      ResponsiveElevatedButton(
                        label: "Save",
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuestionContainer extends StatelessWidget {
  const _QuestionContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: context.dynamicHeight(0.5),
      ),
      decoration: BoxDecoration(
        color: AppColors.scaffoldColor,
        borderRadius: BorderRadius.circular(
          (AppBorderRadius.mediumBorderRadius),
        ),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {
          return _QuestionTile(
            index: index,
            questionType: QuestionType.multiChoice,
            title: "Who wrote the song 'Let's Get It On' ?",
            url: Img.pngIconPath(Img.multiChoiceIcon.path),
          );
        },
      ),
    );
  }
}

class _QuestionTile extends StatelessWidget {
  const _QuestionTile({
    Key? key,
    required this.index,
    this.title,
    this.questionType,
    this.url,
  }) : super(key: key);
  final int index;
  final String? title;
  final QuestionType? questionType;
  final String? url;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text(
          "${index + 1}",
          style: context.textTheme.labelLarge?.copyWith(
            color: AppColors.elevatedButtonColor,
          ),
        ),
      ),

      /// question title
      title: Text(
        title ?? "",
        style: context.textTheme.labelLarge?.copyWith(
          fontSize: 14,
        ),
      ),

      /// question type
      subtitle: Text(
        questionType?.text ?? "",
        style: context.textTheme.labelSmall?.copyWith(fontSize: 12),
      ),
      trailing: ClipRRect(
        borderRadius: BorderRadius.circular(AppPaddings.mediumPadding),
        child: Image(
          image: AssetImage(
            url ?? "",
          ),
          errorBuilder: (context, error, stackTrace) {
            return Card();
          },
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
              child,
        ),
      ),
    );
  }
}
