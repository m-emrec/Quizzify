import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:trivia/core/constants/app_border_radius.dart';
import 'package:trivia/core/constants/app_paddings.dart';
import 'package:trivia/core/constants/image_path.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/core/extensions/empty_padding_extension.dart';
import 'package:trivia/core/shared/widgets/shimmer_widget.dart';
import 'package:trivia/features/main-view/data/models/live_quizzes_model.dart';
import 'package:trivia/features/main-view/presentation/bloc/main_view_bloc.dart';
import 'package:trivia/features/main-view/presentation/widgets/bloc_widget_manager.dart';

import '../../../../core/shared/widgets/list_tiles/quiz_list_tile.dart';

class QuizzesSheet extends StatefulWidget {
  const QuizzesSheet({super.key});

  @override
  State<QuizzesSheet> createState() => _QuizzesSheetState();
}

class _QuizzesSheetState extends State<QuizzesSheet> {
  late MainViewBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = _bloc = GetIt.I<MainViewBloc>();
    _bloc.add(GetLiveQuizzesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocWidgetManager<List<LiveQuizzesModel>>(
      bloc: _bloc,
      loadingWidget: _LoadingQuizzesSheet(),
      loadedWidget: (List<LiveQuizzesModel>? data) => _LoadedQuizzesSheet(data),
    );
  }
}

class _BaseQuizzesSheet extends StatelessWidget {
  const _BaseQuizzesSheet({
    // ignore: unused_element
    this.color = Colors.white,
    required this.child,
    required this.isLoaded,
  });
  final Color color;
  final Widget child;
  final bool isLoaded;

  /// TODO: implement navigate to quiz.
  void onPressed() {}

  final String liveQuizzesTitleText = "Live Quizzes";
  final String seeAllButtonText = "See all";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppBorderRadius.bigBorderRadius),
        ),
      ),
      width: context.dynamicWidth(1),
      height: context.dynamicHeight(0.9),
      child: Padding(
        padding: AppPaddings().pageHPadding +
            EdgeInsets.only(top: AppPaddings.bigPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  liveQuizzesTitleText,
                  style: context.textTheme.titleLarge,
                ),
                TextButton(
                  onPressed: isLoaded ? onPressed : null,
                  child: Text(seeAllButtonText),
                ),
              ],
            ),
            AppPaddings.smallPadding.ph,
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}

class _LoadedQuizzesSheet extends StatelessWidget {
  const _LoadedQuizzesSheet(this.data);
  final List<LiveQuizzesModel>? data;
  @override
  Widget build(BuildContext context) {
    return _BaseQuizzesSheet(
      isLoaded: true,
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppPaddings.bigPadding),
        child: ListView.builder(
          itemCount: data?.length,
          itemBuilder: (context, index) {
            return QuizListTile(
              title: data?[index].title ?? "",
              category: data?[index].category ?? "",
              numberOfQuestions: data?[index].numberOfQuestions ?? "",
              image: AssetImage(ImgPath.friendsCardBgImg),
            );
          },
        ),
      ),
    );
  }
}

class _LoadingQuizzesSheet extends StatelessWidget {
  const _LoadingQuizzesSheet();

  @override
  Widget build(BuildContext context) {
    return _BaseQuizzesSheet(
      isLoaded: false,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: AppPaddings.mediumPadding),
          child: ShimmerWidget(
            height: 80,
          ),
        ),
      ),
    );
  }
}
