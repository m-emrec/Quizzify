import 'package:flutter/material.dart';

class FriendsCard extends StatefulWidget {
  const FriendsCard({
    super.key,
  });

  @override
  State<FriendsCard> createState() => _FriendsCardState();
}

class _FriendsCardState extends State<FriendsCard> {
  @override
  Widget build(BuildContext context) {
    return _LoadingFriendsCard();
  }
}

class _LoadingFriendsCard extends StatelessWidget {
  const _LoadingFriendsCard();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.maxFinite,
      child: Card(),
    );
  }
}

class _LoadedFriendsCard extends StatelessWidget {
  const _LoadedFriendsCard();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
