import 'package:flutter/cupertino.dart';
import 'package:my_app/constants/utils.dart';
import 'package:my_app/features/auth/screens/auth_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileServices {
  void logOut({required BuildContext context}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString("x-auth-token", "");
      Navigator.pushNamedAndRemoveUntil(
        context,
        AuthScreen.routeName,
        (route) => false,
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }
}
