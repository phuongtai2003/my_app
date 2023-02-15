import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/constants/error_handler.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/constants/utils.dart';
import 'package:my_app/models/product.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class HomeServices {
  Future<List<Product>> getProductsByCategory({
    required BuildContext context,
    required String category,
  }) async {
    List<Product> products = [];
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/product?category=$category"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "token": userProvider.user.token,
        },
      );

      httpErrorHandler(
        context: context,
        res: res,
        onSuccess: () {
          final productReturn = jsonDecode(res.body);
          for (int i = 0; i < productReturn.length; i++) {
            products.add(
              Product.fromJson(
                jsonEncode(
                  productReturn[i],
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

  Future<List<Product>> getDealsList({required BuildContext context}) async {
    List<Product> productList = [];
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.get(
        Uri.parse("$uri/api/product/deal"),
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
            productList.add(
              Product.fromJson(
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
    return productList;
  }
}
