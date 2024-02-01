import 'package:flutter/material.dart';

extension EmptyPadding on num {
  /// returns a [SizedBox] with given height.
  /// Used for creating some vertical space.
  get ph => SizedBox(
        height: toDouble(),
      );

  /// returns a [SizedBox] with given width.
  /// Used for creating some horizontal space.
  get pw => SizedBox(
        width: toDouble(),
      );
}
