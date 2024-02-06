import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:trivia/features/auth/data/datasources/auth_injection_container.dart';
import 'package:trivia/features/auth/presentation/pages/sign_in.dart';
import 'package:trivia/features/home/presentation/pages/home_base_view.dart';
import 'package:trivia/features/home/presentation/pages/home_view.dart';
import 'package:trivia/features/home/presentation/view%20manager/home_view_manager.dart';
import 'package:trivia/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:trivia/logger.dart';

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

  /// Check the [Users] collection to see if the user is new or not.
  Future<bool> _isNewUSer(String uid) async {
    var b = await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .get()
        .then((doc) => doc.data());

    if (b != null) return true;
    return false;
  }

  @override
  void dispose() {
    super.dispose();
    AuthInjectionContainer().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // if the user [Authenticated] return HomePage.
        if (snapshot.hasData) {
          /// if  the user is new then navigate to Onboarding if not navigate to Home
          return FutureBuilder(
              future: _isNewUSer(snapshot.data!.uid),
              builder: (BuildContext context, AsyncSnapshot<bool> collection) {
                if (collection.connectionState == ConnectionState.done) {
                  if (collection.data == false) {
                    final String? displayName = snapshot.data?.displayName;

                    return Onboarding(
                      displayName: displayName,
                    );
                  } else {
                    //Home page
                    return const HomeViewManager();
                  }
                }
                return const Scaffold();
              });
        } else {
          // if user not  [Authenticated] return SignInPage
          return const SignInPage();
        }
      },
    );
  }
}
