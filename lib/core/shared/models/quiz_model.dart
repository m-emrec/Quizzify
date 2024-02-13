import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trivia/core/constants/enums/firestore_enums.dart';
import 'package:trivia/logger.dart';

class QuizModel {
  String qid;
  DateTime createdDate;
  String title;
  int playedCount;
  String createdBy;
  String description;
  String photo;
  String category;
  int numberOfQuestions;

  QuizModel({
    required this.qid,
    required this.createdDate,
    required this.title,
    required this.playedCount,
    required this.createdBy,
    required this.description,
    required this.photo,
    required this.category,
    required this.numberOfQuestions,
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
}
