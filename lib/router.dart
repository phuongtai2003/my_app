import 'package:flutter/material.dart';
import 'package:my_app/common/user_bottom_bar.dart';
import 'package:my_app/features/auth/screens/auth_screen.dart';
import 'package:my_app/features/home/screens/home_screen.dart';
import 'package:my_app/features/profile/screens/profile_screen.dart';

Route<dynamic> onGeneratedRoute(RouteSettings settings) {
  switch (settings.name) {
    case ProfileScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const ProfileScreen(),
        settings: settings,
      );
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
        settings: settings,
      );
    case UserBottomBar.routeName:
      return MaterialPageRoute(
        builder: (_) => const UserBottomBar(),
        settings: settings,
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
        settings: settings,
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Page does not exist"),
          ),
        ),
        settings: settings,
      );
  }
}
