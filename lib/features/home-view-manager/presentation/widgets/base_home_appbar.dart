import 'package:flutter/material.dart';
import 'package:trivia/core/extensions/empty_padding_extension.dart';
import 'package:trivia/core/shared/widgets/custom_appbar.dart';

abstract class BaseHomeAppBar extends CustomAppBar {
  BaseHomeAppBar({
    super.key,
  });
}

class HomeAppBar extends BaseHomeAppBar {
  HomeAppBar({
    super.key,
  });

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
                color: Colors.deepOrange,
                size: 16,
              ),
              4.pw,
              const Text(
                "GOOD MORNING",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),

          /// User name
          /// TODO: Get this from outside
          const Text(
            "Mustafa",
            style: TextStyle(color: Colors.white),
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
