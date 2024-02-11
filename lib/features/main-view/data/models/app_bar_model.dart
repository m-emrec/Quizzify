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
    return AppBarModel(
      picUrl: data?.photoURL,
      timeText: "timeText",
      userName: data?.displayName,
    );
  }
}
