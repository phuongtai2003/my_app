import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/common/user_bottom_bar.dart';
import 'package:my_app/constants/error_handler.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/constants/utils.dart';
import 'package:my_app/models/user.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  void signUpUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String name}) async {
    try {
      User user = User(
        id: "",
        email: email,
        name: name,
        password: password,
        address: "",
        type: "",
        token: "",
        cart: [],
      );
      http.Response res = await http.post(
        Uri.parse("$uri/api/signup"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: user.toJson(),
      );
      httpErrorHandler(
        context: context,
        res: res,
        onSuccess: () {
          showSnackBar(context, "Your account has been successfully created!");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserProvider userProvider =
          Provider.of<UserProvider>(context, listen: false);
      http.Response res = await http.post(
        Uri.parse("$uri/api/signin"),
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
      );

      httpErrorHandler(
        context: context,
        res: res,
        onSuccess: () async {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          await sharedPreferences.setString(
              "x-auth-token", jsonDecode(res.body)['token']);
          userProvider.setUser(res.body);
          Navigator.pushNamedAndRemoveUntil(
            context,
            UserBottomBar.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getUserData({required BuildContext context}) async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final String? token = sharedPreferences.getString("x-auth-token");
      if (token == null) {
        sharedPreferences.setString("x-auth-token", "");
      }
      http.Response res = await http.post(
        Uri.parse("$uri/api/tokenIsValid"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "token": token!,
        },
      );
      if (jsonDecode(res.body) == true) {
        http.Response userData = await http.get(
          Uri.parse("$uri/api/getUserData"),
          headers: {
            "Content-Type": "application/json; charset=UTF-8",
            "token": token,
          },
        );
        userProvider.setUser(userData.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
