import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:my_app/constants/error_handler.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/constants/utils.dart';
import 'package:my_app/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class CartServices {
  void removeFromCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(
      context,
      listen: false,
    );
    try {
      http.Response res = await http.delete(
        Uri.parse("$uri/api/remove-from-cart/${product.id!}"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "token": userProvider.user.token,
        },
      );
      httpErrorHandler(
        context: context,
        res: res,
        onSuccess: () {
          final resReturn = jsonDecode(res.body);
          final cart = resReturn['cart'];
          final user = userProvider.user.copyWith(
            cart: cart,
          );
          userProvider.setUserFromModel(user);
          showSnackBar(
            context,
            "${product.name} removed successfully",
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
