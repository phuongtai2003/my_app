import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:my_app/constants/error_handler.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/constants/utils.dart';
import 'package:my_app/models/product.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SellerServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required double price,
    required double weight,
    required int quantity,
    required String description,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      CloudinaryPublic cloudinaryPublic =
          CloudinaryPublic("dhpxifsfm", "d7c0cf8t");
      List<String> imageUrls = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinaryPublic.uploadFile(
          CloudinaryFile.fromFile(
            images[i].path,
            folder: name,
          ),
        );
        imageUrls.add(res.secureUrl);
      }
      Product product = Product(
        name: name,
        price: price,
        weight: weight,
        quantity: quantity,
        description: description,
        category: category,
        images: imageUrls,
      );
      http.Response res = await http.post(
        Uri.parse(
          "$uri/api/product/sell",
        ),
        body: product.toJson(),
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
            "Item $name has been listed successfully",
          );
          Navigator.pop(context);
        },
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }

  Future<List<Product>> getAllProduct({
    required BuildContext context,
  }) async {
    List<Product> results = [];
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.get(
        Uri.parse(
          "$uri/api/product/get",
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
          final products = jsonDecode(res.body);
          for (int i = 0; i < products.length; i++) {
            results.add(
              Product.fromJson(
                jsonEncode(products[i]),
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
    return results;
  }

  void deleteProduct({
    required BuildContext context,
    required Product product,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(
      context,
      listen: false,
    );
    try {
      http.Response res = await http.post(
        Uri.parse(
          "$uri/api/product/delete",
        ),
        body: jsonEncode(
          {
            'id': product.id,
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
        onSuccess: onSuccess,
      );
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
  }
}
