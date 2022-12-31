import 'package:flutter/material.dart';

String uri = "http://192.168.1.9:3000";

class GlobalVariables {
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 14, 205, 215),
      Color.fromARGB(255, 154, 226, 230),
    ],
    stops: [0.3, 0.6, 1],
  );
  static const backgroundColor = Colors.white;
  static const secondaryColor = Color.fromARGB(255, 246, 216, 48);
  static const selectedColor = Color.fromARGB(255, 141, 141, 13);
  static const unselectedColor = Colors.black12;
}
