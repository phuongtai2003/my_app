import 'dart:convert';

import 'package:my_app/constants/error_handler.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/constants/utils.dart';
import 'package:my_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/models/user.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailServices {
  void favoriteProduct({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(
      context,
      listen: false,
    );
    try {
      http.Response res = await http.post(
        Uri.parse("$uri/api/favorite"),
        body: jsonEncode(
          {
            'id': product.id!,
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
          final favoriteProducts =
              (jsonDecode(res.body)['favoriteProducts'] as List)
                  .map((e) => Product.fromMap(e))
                  .toList();
          User user = userProvider.user.copyWith(
            favoriteProducts: favoriteProducts,
          );
          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
