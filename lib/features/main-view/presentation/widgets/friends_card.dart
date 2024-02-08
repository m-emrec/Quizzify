import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trivia/core/constants/app_border_radius.dart';
import 'package:trivia/core/constants/app_color.dart';
import 'package:trivia/core/constants/app_paddings.dart';
import 'package:trivia/core/constants/image_path.dart';
import 'package:trivia/core/extensions/context_extension.dart';
import 'package:trivia/core/shared/widgets/buttons/responsive_elevated_button.dart';
import 'package:trivia/core/shared/widgets/shimmer_widget.dart';

class FriendsCard extends StatefulWidget {
  const FriendsCard({
    super.key,
  });

  @override
  State<FriendsCard> createState() => _FriendsCardState();
}

class _FriendsCardState extends State<FriendsCard> {
  bool _isLoaded = false;
  @override
  Widget build(BuildContext context) {
    return _isLoaded ? _LoadedFriendsCard() : _LoadingFriendsCard();
  }
}

class _LoadingFriendsCard extends StatelessWidget {
  const _LoadingFriendsCard();

  @override
  Widget build(BuildContext context) {
    return _BaseFriendsCard(
      children: [
        ShimmerWidget(
          width: 150,
        ),
        ShimmerWidget(
          width: 300,
        ),
        ShimmerWidget(
          width: 300,
        ),
        ShimmerWidget(
          width: 150,
          height: 45,
        ),
      ],
    );
  }
}

class _LoadedFriendsCard extends StatelessWidget {
  const _LoadedFriendsCard();

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
        _FindFriendsButton()
      ],
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
  const _BaseFriendsCard({required this.children, this.image});
  final List<Widget> children;
  final DecorationImage? image;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          image: image,
          color: AppColors.shimmerWidgetBackgroundColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPaddings.bigPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: children,
          ),
        ),
      ),
    );
  }
}
