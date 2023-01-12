import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/constants/error_handler.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/constants/utils.dart';
import 'package:my_app/models/product.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SearchServices {
  Future<List<Product>> getProductsByName({
    required BuildContext context,
    required String name,
  }) async {
    List<Product> products = [];
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/product/search/$name"),
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
          for (int i = 0; i < resReturn.length; i++) {
            products.add(
              Product.fromJson(
                jsonEncode(
                  resReturn[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return products;
  }
}
