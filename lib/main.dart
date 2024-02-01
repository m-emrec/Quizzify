import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trivia/config/routes/routes.dart';
import 'package:trivia/config/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz Game",
      theme: AppTheme().lightTheme,
      routes: AppRoutes().routes,
      themeMode: ThemeMode.light,
      themeAnimationDuration: const Duration(seconds: 1),
      themeAnimationCurve: Curves.easeOutCirc,
    );
  }
}
