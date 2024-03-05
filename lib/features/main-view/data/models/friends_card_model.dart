import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/constants/enums/firestore_enums.dart';
import '../../domain/entities/friends_card_entity.dart';

class FriendsCardModel extends FriendsCardEntity {
  FriendsCardModel({
    String? name,
    String? picUrl,
    String? point,
    String? uid,
  }) : super(
          name: name,
          picUrl: picUrl,
          point: point,
          uid: uid,
        );

  factory FriendsCardModel.fromFirebase(DocumentSnapshot? data) {
    return FriendsCardModel(
        name: data?[UserEnum.userName.name],
        picUrl: data?[UserEnum.picUrl.name],
        point: data?[UserEnum.points.name],
        uid: data?[UserEnum.uid.name]);
  }
}
