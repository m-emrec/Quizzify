import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const route = "home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: Make a base home view
    return Scaffold(
      floatingActionButton: const CircleAvatar(child: Icon(Icons.add)),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      extendBody: true,
      body: Center(
        child: ElevatedButton(
          onPressed: () => FirebaseAuth.instance.signOut(),
          child: Text("Home Page"),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(label: "s", icon: Icon(Icons.abc)),
          BottomNavigationBarItem(label: "s", icon: Icon(Icons.abc)),
          BottomNavigationBarItem(label: "s", icon: Icon(Icons.abc)),
        ],
      ),
    );
  }
}
