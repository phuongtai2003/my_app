import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/constants/utils.dart';

void httpErrorHandler(
    {required BuildContext context,
    required http.Response res,
    required VoidCallback onSuccess}) {
  switch (res.statusCode) {
    case 200:
      onSuccess();
      break;
    case 500:
      showSnackBar(context, jsonDecode(res.body)['error']);
      break;
    case 400:
      showSnackBar(context, jsonDecode(res.body)['msg']);
      break;
    default:
      showSnackBar(context, res.body);
  }
}
