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

  static const carouselImages = [
    "https://mgg.vn/wp-content/uploads/2018/12/blackpink-nhom-nhac-kpop-dai-dien-dong-hanh-cung-shopee.png",
    "https://www.techsignin.com/wp-content/uploads/2022/03/181680-shopee-15-3-sieu-hoi-tieu-dung.jpeg",
    "https://s3-ap-southeast-1.amazonaws.com/storage.adpia.vn/affiliate_document/img/shopee-8-8-SIEU-HOI-FREESHIP-700x400.jpg",
    "https://image.ngaynay.vn/1200x630/Uploaded/2022/uncdwpjwq/2021_06_14/shoppe-8153.jpg",
  ];

  static const topDeals = [
    "https://phucanhcdn.com/media/product/46683_ideapad_5_pro_14_cloud_ha1.jpg",
    "https://anphat.com.vn/media/product/39061_ideapad_5_pro_16ach6_ct1_01.png",
    "https://anphat.com.vn/media/product/42610_laptop_asus_vivobook_14x_oled_a1403za_km161w__core_i5ngan.jpg",
  ];
}
