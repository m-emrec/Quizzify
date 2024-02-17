import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trivia/core/constants/enums/firestore_enums.dart';

class QuizModel {
  String? qid;
  DateTime createdDate;
  String? title;
  int? playedCount;
  String? createdBy;
  String? description;
  String? photo;
  String? category;
  int? numberOfQuestions;

  QuizModel({
    this.qid,
    required this.createdDate,
    this.title,
    this.playedCount,
    this.createdBy,
    this.description,
    this.photo,
    this.category,
    this.numberOfQuestions,
  });

  factory QuizModel.fromFirebase(Map<String, dynamic> data) {
    Timestamp timestamp = data[QuizEnum.createdDate.name];

    DateTime dateTime = timestamp.toDate();

    return QuizModel(
      qid: data[QuizEnum.qid.name],
      createdDate: dateTime,
      title: data[QuizEnum.title.name],
      playedCount: data[QuizEnum.playedCount.name],
      createdBy: data[QuizEnum.createdBy.name],
      description: data[QuizEnum.description.name],
      photo: data[QuizEnum.photo.name],
      category: data[QuizEnum.category.name],
      numberOfQuestions: data[QuizEnum.numberOfQuestions.name],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      QuizEnum.qid.name: qid,
      QuizEnum.createdDate.name: createdDate,
      QuizEnum.title.name: title,
      QuizEnum.playedCount.name: playedCount,
      QuizEnum.createdBy.name: createdBy,
      QuizEnum.description.name: description,
      QuizEnum.photo.name: photo,
      QuizEnum.category.name: category,
      QuizEnum.numberOfQuestions.name: numberOfQuestions,
    };
    return map;
  }
}
