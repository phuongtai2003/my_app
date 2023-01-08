import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:my_app/constants/error_handler.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/constants/utils.dart';
import 'package:my_app/features/auth/screens/auth_screen.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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

  void turn({required BuildContext context}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final token = sharedPreferences.getString("x-auth-token");
      http.Response res = await http.post(
        Uri.parse("$uri/api/turn"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "token": token!,
        },
      );
      httpErrorHandler(
        context: context,
        res: res,
        onSuccess: () {
          final newUserType = jsonDecode(res.body)['type'];
          final user = userProvider.user.copyWith(type: newUserType);
          userProvider.setUserFromModel(user);
          showSnackBar(
            context,
            "Turning process completed",
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
