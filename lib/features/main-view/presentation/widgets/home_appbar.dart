import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:trivia/core/constants/app_color.dart';
import 'package:trivia/core/extensions/empty_padding_extension.dart';
import 'package:trivia/core/shared/widgets/custom_appbar.dart';
import 'package:trivia/core/shared/widgets/shimmer_widget.dart';
import 'package:trivia/features/main-view/data/models/app_bar_model.dart';
import 'package:trivia/features/main-view/presentation/bloc/main_view_bloc.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  late MainViewBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = GetIt.I<MainViewBloc>();
    _bloc.add(GetAppBarInfoEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainViewBloc, MainViewState>(
        bloc: _bloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state.runtimeType == MainViewLoadingState) {
            return _LoadingHomeAppBar(context);
          } else if (state.runtimeType == MainViewSuccessState<AppBarModel>) {
            state as MainViewSuccessState<AppBarModel>;
            return _LoadedHomeAppBar(
              context,
              userName: state.data?.userName,
              dayTimeText: state.data?.timeText,
              picUrl: state.data?.picUrl,
            );
          }
          return SizedBox();
        });
  }
}

class _LoadedHomeAppBar extends CustomAppBar {
  _LoadedHomeAppBar(
    this.ctx, {
    this.userName,
    this.dayTimeText,
    this.picUrl,
  });
  final BuildContext ctx;
  final String? userName;
  final String? dayTimeText;
  final String? picUrl;

  @override
  bool? get centerTitle => false;

  @override
  Widget? get title => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// good morning text
          Row(
            children: [
              const Icon(
                Icons.wb_sunny_outlined,
                color: AppColors.recentQuizCardTileColor,
                size: 16,
              ),
              4.pw,
              Text(
                dayTimeText ?? "",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color:
                        AppColors.recentQuizCardTileColor //Color(0xffECC7DD),
                    ),
              ),
            ],
          ),

          /// User name

          Text(
            userName ?? "",
          ),
        ],
      );

  @override
  List<Widget>? get actions => [
        GestureDetector(
          onTap: () => FirebaseAuth.instance.signOut(),
          child: CircleAvatar(
            radius: 32,
            child: picUrl == null

                /// TODO: Clip image
                ? Icon(Icons.person_outline_rounded)
                : Image.network(
                    picUrl ?? "",
                    fit: BoxFit.fill,
                  ),
          ),
        ),
      ];
}

class _LoadingHomeAppBar extends _LoadedHomeAppBar {
  _LoadingHomeAppBar(super.ctx);

  @override
  Widget? get title => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget(
            width: 100,
          ),
          8.ph,
          ShimmerWidget(
            width: 200,
          ),
        ],
      );

  @override
  List<Widget>? get actions => [
        ShimmerWidget(
          shape: BoxShape.circle,
          height: 64,
          width: 64,
        )
      ];
}
