import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:trivia/core/constants/error_texts.dart';
import 'package:trivia/features/auth/data/datasources/auth_injection_container.dart';
import 'package:trivia/features/auth/presentation/pages/sign_in.dart';

import '../../domain/repositories/auth_repo.dart';

class AuthManager extends StatefulWidget {
  static const route = "/";
  const AuthManager({super.key});

  @override
  State<AuthManager> createState() => _AuthManagerState();
}

class _AuthManagerState extends State<AuthManager> {
  @override
  void initState() {
    super.initState();
    // initialize GetIt .
    bool isAlreadyRegistered = GetIt.instance.isRegistered(instance: AuthRepo);
    if (!isAlreadyRegistered) AuthInjectionContainer().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // if the user [Authenticated] return HomePage.
        if (snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () => FirebaseAuth.instance.signOut(),
                child: const Text(
                  ("Sign Out"),
                ),
              ),
            ),
          );
          // if user not  [Authenticated] return SignInPage
        } else {
          return const SignInPage();
        }
      },
    );
  }
}
