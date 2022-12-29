import 'package:flutter/material.dart';

enum Auth {
  signUp,
  signIn,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static const String routeName = "/auth-screen";

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
