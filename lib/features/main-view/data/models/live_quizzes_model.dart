import 'package:trivia/core/constants/enums/firestore_enums.dart';
import 'package:trivia/features/main-view/domain/entities/live_quizzes_entity.dart';

class LiveQuizzesModel extends LiveQuizzesEntity {
  LiveQuizzesModel({
    String? qid,
    String? category,
    String? picUrl,
    String? title,
    String? numberOfQuestions,
  }) : super(
          category: category,
          numberOfQuestions: numberOfQuestions,
          picUrl: picUrl,
          qid: qid,
          title: title,
        );

  factory LiveQuizzesModel.fromFirebase(Map data) {
    return LiveQuizzesModel(
      category: data[QuizEnum.category.name],
      numberOfQuestions: data[QuizEnum.numberOfQuestions.name],
      picUrl: data[QuizEnum.picture.name],
      qid: data[QuizEnum.qid.name],
      title: data[QuizEnum.title.name],
    );
  }
}
