import 'package:flutter/material.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Text(userProvider.user.toJson()),
      ),
    );
  }
}