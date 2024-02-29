import 'package:flutter/material.dart';

import '../widgets/add_cover_image_container.dart';

mixin AddCoverImageContainerMixin on State<AddCoverImageContainer> {
  final String addCoverImageText = "Add Cover Image";

  final double iconSize = 64;

  showImageSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SelectCoverImageBottomSheet();
      },
    );
  }
}
