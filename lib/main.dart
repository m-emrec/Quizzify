import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trivia/config/routes/routes.dart';
import 'package:trivia/config/theme/theme.dart';
import 'package:trivia/core/constants/app_color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.scaffoldColor,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quizzify",
      theme: AppTheme().lightTheme,
      routes: AppRoutes().routes,
      themeMode: ThemeMode.light,
      themeAnimationDuration: const Duration(seconds: 1),
      themeAnimationCurve: Curves.easeOutCirc,
    );
  }
}
