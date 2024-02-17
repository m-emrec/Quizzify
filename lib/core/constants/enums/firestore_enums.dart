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
  coverImage,
  questionIndex,
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
  Music(
      iconLink:
          '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><path fill="currentColor" d="M4 12h3a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-7C2 6.477 6.477 2 12 2s10 4.477 10 10v7a2 2 0 0 1-2 2h-3a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h3a8 8 0 1 0-16 0"/></svg>'),
  Math(
      iconLink:
          '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 5h-7L8 19l-3-6H3m11 0l6 6m-6 0l6-6"/></svg>'),
  Sports(
      iconLink:
          '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><path fill="currentColor" d="M4.05 11H6.9q-.15-.95-.575-1.775T5.25 7.75q-.45.725-.763 1.538T4.05 11m13.05 0h2.85q-.125-.9-.437-1.713T18.75 7.75q-.65.65-1.075 1.475T17.1 11M5.25 16.25q.65-.65 1.075-1.475T6.9 13H4.05q.125.9.438 1.713t.762 1.537m13.5 0q.45-.725.763-1.537T19.95 13H17.1q.15.95.575 1.775t1.075 1.475M8.95 11H11V4.05q-1.325.2-2.463.738T6.5 6.2q.975.95 1.613 2.163T8.95 11M13 11h2.05q.2-1.425.838-2.637T17.5 6.2q-.9-.875-2.037-1.412T13 4.05zm-2 8.95V13H8.95q-.2 1.425-.837 2.638T6.5 17.8q.9.875 2.038 1.413T11 19.95m2 0q1.325-.2 2.463-.737T17.5 17.8q-.975-.95-1.612-2.162T15.05 13H13zM12 22q-2.075 0-3.9-.787t-3.175-2.138q-1.35-1.35-2.137-3.175T2 12q0-2.075.788-3.9t2.137-3.175q1.35-1.35 3.175-2.137T12 2q2.075 0 3.9.788t3.175 2.137q1.35 1.35 2.138 3.175T22 12q0 2.075-.788 3.9t-2.137 3.175q-1.35 1.35-3.175 2.138T12 22"/></svg>'),
  Art(
      iconLink:
          '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><path fill="currentColor" d="M12 22A10 10 0 0 1 2 12A10 10 0 0 1 12 2c5.5 0 10 4 10 9a6 6 0 0 1-6 6h-1.8c-.3 0-.5.2-.5.5c0 .1.1.2.1.3c.4.5.6 1.1.6 1.7c.1 1.4-1 2.5-2.4 2.5m0-18a8 8 0 0 0-8 8a8 8 0 0 0 8 8c.3 0 .5-.2.5-.5c0-.2-.1-.3-.1-.4c-.4-.5-.6-1-.6-1.6c0-1.4 1.1-2.5 2.5-2.5H16a4 4 0 0 0 4-4c0-3.9-3.6-7-8-7m-5.5 6c.8 0 1.5.7 1.5 1.5S7.3 13 6.5 13S5 12.3 5 11.5S5.7 10 6.5 10m3-4c.8 0 1.5.7 1.5 1.5S10.3 9 9.5 9S8 8.3 8 7.5S8.7 6 9.5 6m5 0c.8 0 1.5.7 1.5 1.5S15.3 9 14.5 9S13 8.3 13 7.5S13.7 6 14.5 6m3 4c.8 0 1.5.7 1.5 1.5s-.7 1.5-1.5 1.5s-1.5-.7-1.5-1.5s.7-1.5 1.5-1.5"/></svg>'),
  Science(
      iconLink:
          '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><path fill="currentColor" d="M5 21q-1.275 0-1.812-1.137t.262-2.113L9 11V5H8q-.425 0-.712-.288T7 4q0-.425.288-.712T8 3h8q.425 0 .713.288T17 4q0 .425-.288.713T16 5h-1v6l5.55 6.75q.8.975.263 2.113T19 21zm0-2h14l-6-7.3V5h-2v6.7zm7-7"/></svg>'),
  History(
      iconLink:
          '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 19a9 9 0 0 1 9 0a9 9 0 0 1 9 0M3 6a9 9 0 0 1 9 0a9 9 0 0 1 9 0M3 6v13m9-13v13m9-13v13"/></svg>'),
  Travel(
      iconLink:
          '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 15 15"><path fill="none" stroke="currentColor" d="M7.5 15v-3M4 14.5h7M11.469 1A6 6 0 1 1 3.5 9.972m4-7.472a3 3 0 1 0 0 6a3 3 0 0 0 0-6Z"/></svg>'),
  Tech(
      iconLink:
          '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 20 20"><path fill="currentColor" d="M5.845 4C5.364 4 5 4.374 5 4.804V6H4V4.804C4 3.794 4.84 3 5.845 3h10.31C17.16 3 18 3.794 18 4.804v7.392c0 1.01-.84 1.804-1.845 1.804H10v-1h6.155c.481 0 .845-.374.845-.804V4.804c0-.43-.364-.804-.845-.804zM10 12h2.5a.5.5 0 0 0 0-1H10zm-5 3a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1zM2 8.5A1.5 1.5 0 0 1 3.5 7h4A1.5 1.5 0 0 1 9 8.5v8A1.5 1.5 0 0 1 7.5 18h-4A1.5 1.5 0 0 1 2 16.5zM3.5 8a.5.5 0 0 0-.5.5v8a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-8a.5.5 0 0 0-.5-.5z"/></svg>'),
  ;

  const Categories({required this.iconLink});

  final String iconLink;
}
