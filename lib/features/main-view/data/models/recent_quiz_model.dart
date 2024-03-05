import '../../../../core/constants/enums/firestore_enums.dart';
import '../../domain/entities/recent_quiz_entity.dart';

class RecentQuizModel extends RecentQuizEntity {
  RecentQuizModel({
    String? title,
    String? percentDone,
    String? qid,
    String? category,
  }) : super(
          percentDone: percentDone,
          qid: qid,
          title: title,
          category: category,
        );

  factory RecentQuizModel.fromFactory(Map data) {
    return RecentQuizModel(
      percentDone: data[PlayedQuizEnum.percentDone.name],
      qid: data[PlayedQuizEnum.qid.name],
      title: data[PlayedQuizEnum.title.name],
      category: data[PlayedQuizEnum.category.name],
    );
  }
}
