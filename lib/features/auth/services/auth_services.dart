import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/constants/error_handler.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/constants/utils.dart';
import 'package:my_app/modals/user.dart';

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
}
