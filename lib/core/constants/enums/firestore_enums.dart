// ignore_for_file: constant_identifier_names

enum CollectionEnum {
  Users,
  Quizzes,
  PlayedQuizzes,
  DailyQuizData,
  Categories,
  Questions,
}

enum UserEnum {
  uid,
  picUrl,
  points,
  lastPlayedDate,
  userName,
  email,
  friends,
  badges,
  quizCreated,
}

enum QuizEnum {
  title,
  qid,
  numberOfQuestions,
  description,
  photo,
  createdDate,
  createdBy,
  playedCount,
  category,
}

enum QuestionEnum {
  questionId,
  isMultiChoice,
  question,
  correctAnswer,
  wrongAnswer,
  duration,
}

enum PlayedQuizEnum {
  qid,
  title,
  answeredCorrect,
  answeredWrong,
  notAnswered,
  earnedPoint,
  lastPlayedDate,
  category,
  percentDone,
}

enum Categories {
  music(12),
  math(19),
  sports(21),
  art(25),
  mythology(20),
  history(23),
  politics(24),
  general(9),
  computers(18),
  celebrities(26);

  const Categories(this.code);

  /// This [code] parameter given for communicating with the API.
  final int code;
}
