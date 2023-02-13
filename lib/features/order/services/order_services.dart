import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:my_app/constants/error_handler.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/constants/utils.dart';
import 'package:my_app/models/order.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class OrderServices {
  Future<List<Order>> getAllOrder({required BuildContext context}) async {
    List<Order> orderList = [];
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/fetch-order"),
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
          for (int i = 0; i < returnRes.length; i++) {
            orderList.add(
              Order.fromJson(
                jsonEncode(
                  returnRes[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
    return orderList;
  }
}
