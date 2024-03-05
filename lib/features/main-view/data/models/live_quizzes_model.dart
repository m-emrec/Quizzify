import '../../../../core/shared/models/quiz_model.dart';
import '../../domain/entities/live_quizzes_entity.dart';

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

  factory LiveQuizzesModel.fromFirebase(QuizModel data) {
    return LiveQuizzesModel(
      category: data.category,
      numberOfQuestions: data.numberOfQuestions.toString(),
      picUrl: data.photo,
      qid: data.qid,
      title: data.title,
    );
  }
}
