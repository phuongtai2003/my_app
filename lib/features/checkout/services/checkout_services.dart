import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/constants/error_handler.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/constants/utils.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/models/order.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class CheckoutServices {
  void setUserAddress({
    required BuildContext context,
    required String address,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse("$uri/api/set-user-address"),
        body: jsonEncode(
          {
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
          final newAddress = jsonDecode(res.body)['address'];
          final newUser = userProvider.user.copyWith(address: newAddress);
          userProvider.setUserFromModel(newUser);
        },
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }

  void createOrder(
      {required BuildContext context,
      required int totalPrice,
      required String paymentMethod}) async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      http.Response res = await http.post(
        Uri.parse("$uri/api/place-order"),
        body: jsonEncode({
          'totalPrice': totalPrice,
          'paymentMethod': paymentMethod,
        }),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "token": userProvider.user.token,
        },
      );
      httpErrorHandler(
        context: context,
        res: res,
        onSuccess: () {
          final newCart = jsonDecode(res.body)['cart'];
          final newUser = userProvider.user.copyWith(cart: newCart);
          userProvider.setUserFromModel(newUser);
          Navigator.pop(context);
          showSnackBar(context, "Order has been placed successfully");
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
