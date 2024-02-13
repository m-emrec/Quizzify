import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/app_bar_entitiy.dart';

class AppBarModel extends AppBarEntity {
  AppBarModel({
    String? userName,
    String? picUrl,
    String? timeText,
  }) : super(
          picUrl: picUrl,
          timeText: timeText,
          userName: userName,
        );

  factory AppBarModel.fromFirebase(User? data) {
    /// this function used to return a text depending on time interval.
    String dayTimeText() {
      final int nowHour = DateTime.now().hour;

      switch (nowHour) {
        case <= 12:
          return "Good Morning";
        case > 12 && < 18:
          return "Good Afternoon";
        case >= 18 && <= 21:
          return "Good Evening";
        case >= 22:
          return "Good Night";
        default:
      }

      return "";
    }

    return AppBarModel(
      picUrl: data?.photoURL,
      timeText: dayTimeText(),
      userName: data?.displayName,
    );
  }
}
