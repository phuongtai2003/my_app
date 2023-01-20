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

  void rateProduct(
      {required BuildContext context,
      required Product product,
      required double rating}) async {
    final userProvider = Provider.of<UserProvider>(
      context,
      listen: false,
    );
    try {
      http.Response res = await http.post(
        Uri.parse("$uri/api/product/rate"),
        body: jsonEncode(
          {
            'id': product.id!,
            'rate': rating,
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
          showSnackBar(
            context,
            "${product.name} rated successfully",
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void addToCart(
      {required BuildContext context,
      required Product product,
      required int quantity}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse("$uri/api/add-to-cart"),
        body: jsonEncode(
          {
            'id': product.id,
            'quantity': quantity,
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
          final cart = returnRes['cart'];
          final newUser = userProvider.user.copyWith(cart: cart);
          userProvider.setUserFromModel(
            newUser,
          );
          showSnackBar(
            context,
            "${product.name} added to cart successfully",
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
