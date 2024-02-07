import 'package:flutter/material.dart';
import 'package:trivia/core/extensions/empty_padding_extension.dart';
import 'package:trivia/core/shared/widgets/custom_appbar.dart';
import 'package:trivia/core/shared/widgets/shimmer_widget.dart';

import '../../../../core/constants/app_color.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool _isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return _isLoaded
        ? _LoadedHomeAppBar(
            context,
            userName: "Mustafa",
            dayTimeText: "Good Morning",
          )
        : _LoadingHomeAppBar(context);
  }
}

class _LoadedHomeAppBar extends CustomAppBar {
  _LoadedHomeAppBar(
    this.ctx, {
    this.userName,
    this.dayTimeText,
  });
  final BuildContext ctx;
  final String? userName;
  final String? dayTimeText;

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
                color: Color(0xffECC7DD),
                size: 16,
              ),
              4.pw,
              Text(
                dayTimeText ?? "",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffECC7DD),
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
        const CircleAvatar(
          radius: 32,
          child: Icon(Icons.person),
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
