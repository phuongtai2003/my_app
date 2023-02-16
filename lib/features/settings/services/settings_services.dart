import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:my_app/constants/error_handler.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/constants/utils.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class SettingsServices {
  void changeAccountDetails({
    required BuildContext context,
    required String name,
    required String email,
    required String address,
  }) async {
    final userProvider = Provider.of<UserProvider>(
      context,
      listen: false,
    );
    try {
      http.Response res = await http.post(
        Uri.parse("$uri/api/change-details"),
        body: jsonEncode(
          {
            'name': name,
            'email': email,
            'address': address,
          },
        ),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "token": userProvider.user.token,
        },
      );

      httpErrorHandler(
        context: context,
        res: res,
        onSuccess: () {
          final returnRes = jsonDecode(res.body);
          final newUser = userProvider.user.copyWith(
            name: returnRes['name'],
            email: returnRes['email'],
            address: returnRes['address'],
          );
          userProvider.setUserFromModel(newUser);
          Navigator.pop(context);
          showSnackBar(
            context,
            "User information has been updated",
          );
        },
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }
}
