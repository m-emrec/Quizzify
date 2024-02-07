import 'package:flutter/material.dart';
import 'package:trivia/core/extensions/empty_padding_extension.dart';
import 'package:trivia/core/shared/widgets/custom_appbar.dart';

class HomeAppBar extends CustomAppBar {
  HomeAppBar(
    this.ctx, {
    super.key,
  });
  final BuildContext ctx;
  @override
  bool? get centerTitle => false;
  @override
  Widget? get title => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// good morning text
          /// TODO: get this from DayTime
          Row(
            children: [
              const Icon(
                Icons.wb_sunny_outlined,
                color: Color(0xffECC7DD),
                size: 16,
              ),
              4.pw,
              const Text(
                "GOOD MORNING",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffECC7DD),
                ),
              ),
            ],
          ),

          /// User name
          /// TODO: Get this from outside
          const Text(
            "Mustafa",
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
