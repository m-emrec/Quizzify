import 'package:trivia/core/constants/enums/firestore_enums.dart';

class QuestionModel {
  final String? question;
  final Duration? duration;
  final String? correctAnswer;
  final List<String>? wrongAnswers;
  final bool? isMultiChoice;
  final String? questionId;
  final String? coverImage;
  final int? questionIndex;

  QuestionModel({
    this.question,
    this.duration,
    this.correctAnswer,
    this.wrongAnswers,
    this.isMultiChoice,
    this.questionId,
    this.coverImage,
    this.questionIndex,
  });

  factory QuestionModel.fromFirebase() {
    return QuestionModel();
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      QuestionEnum.question.name: question,
      QuestionEnum.duration.name: duration,
      QuestionEnum.correctAnswer.name: correctAnswer,
      QuestionEnum.wrongAnswer.name: wrongAnswers,
      QuestionEnum.isMultiChoice.name: isMultiChoice,
      QuestionEnum.questionId.name: questionId,
      QuestionEnum.coverImage.name: coverImage,
      QuestionEnum.questionIndex.name: questionIndex,
    };
    return map;
  }
}