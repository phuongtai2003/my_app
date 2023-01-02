import 'package:flutter/material.dart';

String uri = "http://192.168.1.2:3000";

class GlobalVariables {
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 217, 181, 36),
      Color.fromARGB(255, 212, 214, 85),
    ],
    stops: [0.3, 0.6],
  );
  static const backgroundColor = Colors.white;
  static const secondaryColor = Color.fromARGB(255, 246, 216, 48);
  static const selectedColor = Color.fromARGB(255, 141, 141, 13);
  static const unselectedColor = Colors.black12;
}
