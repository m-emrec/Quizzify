// Music(12),
// Math(19),
// Sports(21),
// Art(25),
// Mythology(20),
// History(23),
// Politics(24),
// General(9),
// Computers(18),
// Celebrities(26);

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import '../../constants/app_color.dart';
import '../../constants/enums/firestore_enums.dart';

class IconManager {
  IconManager();

  static Iconify icon(
      {required Categories category,
      Color color = AppColors.elevatedButtonColor}) {
    Iconify _iconWidget(String icon,
        {Color color = AppColors.elevatedButtonColor}) {
      return Iconify(
        _IconsEnum.math.iconLink,
        color: color,
        size: 32,
      );
    }

    switch (category) {
      case Categories.Math:
        _iconWidget(_IconsEnum.math.iconLink);
        break;
      default:
    }

    return _iconWidget(
      _IconsEnum.sports.iconLink,
      color: color,
    );
  }
}

enum _IconsEnum {
  math(
      '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 5h-7L8 19l-3-6H3m11 0l6 6m-6 0l6-6"/></svg>'),

  sports(
      '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><path fill="currentColor" d="M4.05 11H6.9q-.15-.95-.575-1.775T5.25 7.75q-.45.725-.763 1.538T4.05 11m13.05 0h2.85q-.125-.9-.437-1.713T18.75 7.75q-.65.65-1.075 1.475T17.1 11M5.25 16.25q.65-.65 1.075-1.475T6.9 13H4.05q.125.9.438 1.713t.762 1.537m13.5 0q.45-.725.763-1.537T19.95 13H17.1q.15.95.575 1.775t1.075 1.475M8.95 11H11V4.05q-1.325.2-2.463.738T6.5 6.2q.975.95 1.613 2.163T8.95 11M13 11h2.05q.2-1.425.838-2.637T17.5 6.2q-.9-.875-2.037-1.412T13 4.05zm-2 8.95V13H8.95q-.2 1.425-.837 2.638T6.5 17.8q.9.875 2.038 1.413T11 19.95m2 0q1.325-.2 2.463-.737T17.5 17.8q-.975-.95-1.612-2.162T15.05 13H13zM12 22q-2.075 0-3.9-.787t-3.175-2.138q-1.35-1.35-2.137-3.175T2 12q0-2.075.788-3.9t2.137-3.175q1.35-1.35 3.175-2.137T12 2q2.075 0 3.9.788t3.175 2.137q1.35 1.35 2.138 3.175T22 12q0 2.075-.788 3.9t-2.137 3.175q-1.35 1.35-3.175 2.138T12 22"/></svg>'),
  ;

  final String iconLink;

  const _IconsEnum(this.iconLink);
}
