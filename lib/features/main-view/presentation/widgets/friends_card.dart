import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:trivia/core/constants/app_border_radius.dart';
import 'package:trivia/core/constants/app_color.dart';
import 'package:trivia/core/constants/app_paddings.dart';
import 'package:trivia/core/constants/image_path.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/core/shared/widgets/shimmer_widget.dart';
import 'package:trivia/features/main-view/data/models/friends_card_model.dart';
import 'package:trivia/features/main-view/presentation/bloc/main_view_bloc.dart';

import '../../../../core/shared/widgets/list_tiles/friends_tile.dart';

class FriendsCard extends StatefulWidget {
  const FriendsCard({
    super.key,
  });

  @override
  State<FriendsCard> createState() => _FriendsCardState();
}

class _FriendsCardState extends State<FriendsCard> {
  late MainViewBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = GetIt.I<MainViewBloc>();
    _bloc.add(GetFriendsInfoEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainViewBloc, MainViewState>(
      bloc: _bloc,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case MainViewLoadingState:
            return _LoadingFriendsCard();
          case const (MainViewSuccessState<FriendsCardModel>):
            return _LoadedFriendsCard();
          default:
            return SizedBox();
        }
      },
    );
  }
}

class _LoadingFriendsCard extends StatelessWidget {
  const _LoadingFriendsCard();

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      child: _BaseFriendsCard(
        child: SizedBox(),
      ),
    );
  }
}

class _LoadedFriendsCard extends StatelessWidget {
  const _LoadedFriendsCard();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _BaseFriendsCard(
          image: DecorationImage(
            image: AssetImage(ImgPath.friendsCardWithFriendsBgImg),
            fit: BoxFit.cover,
          ),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return FriendsTile();
            },
          ),
        ),

        /// add friend button || Navigate to AddFriendPage
        Positioned(
          bottom: 8,
          right: 8,
          child: IconButton.filled(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}

// ignore: unused_element
class _NoFriendsCard extends StatelessWidget {
  final String _title = "FEATURED";
  final String _bodyText =
      "Take part in challenges with friends or other players";

  @override
  Widget build(BuildContext context) {
    return _BaseFriendsCard(
      image: DecorationImage(
        image: AssetImage(ImgPath.friendsCardBgImg),
        fit: BoxFit.fill,
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPaddings.bigPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  _title,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: AppColors.friendsCardTitleColor,
                  ),
                ),
                Text(
                  _bodyText,
                  style: context.textTheme.labelLarge
                      ?.copyWith(color: AppColors.friendsCardBodyTextColor),
                  textAlign: TextAlign.center,
                ),
                _FindFriendsButton(),
              ],
            ),
          ),
        )
      ]),
    );
  }
}

class _FindFriendsButton extends StatelessWidget {
  const _FindFriendsButton();
  final String _buttonLabel = "Find Friends";
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: AppPaddings.mediumPadding,
          vertical: AppPaddings.mediumPadding,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppBorderRadius.mediumBorderRadius +
                AppBorderRadius.smallBorderRadius,
          ),
        ),
      ),
      onPressed: () {},
      icon: Icon(Icons.filter_tilt_shift_rounded),
      label: Text(
        _buttonLabel,
      ),
    );
  }
}

class _BaseFriendsCard extends StatelessWidget {
  const _BaseFriendsCard({required this.child, this.image});
  final Widget child;
  final DecorationImage? image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 13,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            image: image,
            // color: AppColors.scaffoldColor,
          ),
          child: child,
        ),
      ),
    );
  }
}
