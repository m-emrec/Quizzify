import 'package:flutter/material.dart';

import '../pages/create_quiz_page.dart';

mixin CreateQuizPageMixin on State<CreateQuizPage> {
  final String appBarTitle = "Create Quiz";

  final String floatingActionButtonLabel = "Add Question";
  final TextEditingController quizTitleController = TextEditingController();
  final TextEditingController quizDescController = TextEditingController();
}
