import 'package:flutter/material.dart';

String uri = "http://192.168.37.1:3000";

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

  static const categories = [
    {
      "title": "Book",
      "image": "assets/images/book.png",
    },
    {
      "title": "Laptop",
      "image": "assets/images/laptop.png",
    },
    {
      "title": "Accessories",
      "image": "assets/images/accessories.png",
    },
    {
      "title": "Sport",
      "image": "assets/images/sport.png",
    },
    {
      "title": "Fashion",
      "image": "assets/images/fashion.png",
    },
  ];
}
