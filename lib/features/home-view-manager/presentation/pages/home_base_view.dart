import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trivia/core/constants/app_border_radius.dart';
import 'package:trivia/core/constants/app_color.dart';
import 'package:trivia/core/extensions/context_extension.dart';

class HomeBaseView extends StatefulWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final dynamic Function(int) bottomNavBarOnTap;
  final int bottomNavBarIndex;
  const HomeBaseView(
      {super.key,
      this.body,
      required this.bottomNavBarOnTap,
      required this.bottomNavBarIndex,
      this.appBar});

  @override
  State<HomeBaseView> createState() => _HomeBaseViewState();
}

class _HomeBaseViewState extends State<HomeBaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeScaffoldColor,
      extendBody: true,
      floatingActionButton: const _FloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: widget.body,
      bottomNavigationBar: _HomeBottomNavigationBar(widget: widget),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  void addQuizzesToFirestore(
      String category, List<List<Map<String, dynamic>>> quizData) async {
    for (List<Map<String, dynamic>> quizzes in quizData) {
      for (var quiz in quizzes) {
        await FirebaseFirestore.instance
            .collection("Categories")
            .doc(category)
            .set({"_": ""});
        await FirebaseFirestore.instance
            .collection("Categories")
            .doc(category)
            .collection("Quizzes")
            .add({
          "title": quiz["question"],
          "description": "",
          "photo": "",
          "createdDate": DateTime.now(),
          "createdBy": FirebaseAuth.instance.currentUser?.uid,
          "playedCount": 0,
          "qid": "",
        }).then((value) {
          value.update({"qid": value.id});

          for (Map<String, dynamic> map in quizzes) {
            value.collection("Questions").add(map);
          }
        });
      }
    }
  }

  onT() {
    String category = "art";
    List<List<Map<String, dynamic>>> quizData = [
      [
        {
          "isMultiChoice": true,
          "question": "Who painted the Mona Lisa?",
          "correct_answer": "Leonardo da Vinci",
          "incorrect_answers": [
            "Vincent van Gogh",
            "Pablo Picasso",
            "Claude Monet"
          ]
        },
        {
          "isMultiChoice": true,
          "question": "In which century did the Renaissance period begin?",
          "correct_answer": "14th century",
          "incorrect_answers": ["15th century", "16th century", "17th century"]
        },
        {
          "isMultiChoice": true,
          "question":
              "Which art movement is known for its use of bright colors and bold shapes?",
          "correct_answer": "Fauvism",
          "incorrect_answers": ["Cubism", "Impressionism", "Surrealism"]
        },
        {
          "isMultiChoice": true,
          "question": "Who is the famous sculptor of 'David' and 'Pieta'?",
          "correct_answer": "Michelangelo",
          "incorrect_answers": ["Donatello", "Leonardo da Vinci", "Raphael"]
        },
        {
          "isMultiChoice": true,
          "question":
              "Which Dutch artist is known for his sunflower paintings?",
          "correct_answer": "Vincent van Gogh",
          "incorrect_answers": ["Rembrandt", "Vermeer", "Mondrian"]
        },
      ],
    ];
    addQuizzesToFirestore(category, quizData);
  }

  onTap() async {
    List<List<Map<String, dynamic>>> a = [
      [
        {
          "isMultiChoice": true,
          "question": "In Babylonian mythology, who is the god of wisdom?",
          "correct_answer": "Enki",
          "incorrect_answers": ["Marduk", "Nabu", "Ishtar"]
        },
        {
          "isMultiChoice": true,
          "question":
              "What is the name of the legendary bird in Arabian mythology that can revive itself with fire?",
          "correct_answer": "Phoenix",
          "incorrect_answers": ["Simurgh", "Ziz", "Roc"]
        },
        {
          "isMultiChoice": true,
          "question": "Who is the god of the sun in Inca mythology?",
          "correct_answer": "Inti",
          "incorrect_answers": ["Viracocha", "Pachamama", "Mama Quilla"]
        },
        {
          "isMultiChoice": true,
          "question": "What is the name of the Chinese goddess of the moon?",
          "correct_answer": "Chang'e",
          "incorrect_answers": ["Guanyin", "Xihe", "Yue Lao"]
        },
        {
          "isMultiChoice": true,
          "question":
              "According to African mythology, who is the trickster god?",
          "correct_answer": "Anansi",
          "incorrect_answers": ["Eshu", "Legba", "Loki"]
        }
      ]
    ];
    int i = 0;
    for (var element in a) {
      await FirebaseFirestore.instance
          .collection("Categories")
          .doc("mythology")
          .collection("Quizzes")
          .add({
        "title": i.toString(),
        "description": "",
        "photo": "",
        "createdDate": DateTime.now(),
        "createdBy": FirebaseAuth.instance.currentUser?.uid,
        "playedCount": 0,
        "qid": "",
      }).then((value) {
        value.update({"qid": value.id});

        for (Map<String, dynamic> map in element) {
          value.collection("Questions").add(map);
        }
      });
      i++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () {}, // onT,
      child: const Icon(Icons.add),
    );
  }
}

class _HomeBottomNavigationBar extends StatelessWidget {
  const _HomeBottomNavigationBar({
    required this.widget,
  });

  final HomeBaseView widget;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      activeColor: context.theme.bottomNavigationBarTheme.selectedItemColor,
      inactiveColor: context.theme.bottomNavigationBarTheme.unselectedItemColor,
      backgroundColor: context.theme.bottomNavigationBarTheme.backgroundColor,
      icons: const [
        Icons.home,
        Icons.search_outlined,
        Icons.leaderboard_outlined,
        Icons.person_outline_outlined,
      ],
      activeIndex: widget.bottomNavBarIndex,
      elevation: 5,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: AppBorderRadius.bottomNavBarCornerRadius,
      rightCornerRadius: AppBorderRadius.bottomNavBarCornerRadius,
      onTap: (index) => widget.bottomNavBarOnTap(index),
    );
  }
}
