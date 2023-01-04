import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';

class CarouselImages extends StatelessWidget {
  const CarouselImages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: CarouselSlider(
        items: GlobalVariables.carouselImages.map(
          (e) {
            return Builder(
              builder: (BuildContext context) {
                return Image.network(
                  e,
                  fit: BoxFit.cover,
                  height: 250,
                );
              },
            );
          },
        ).toList(),
        options: CarouselOptions(
          height: 250,
          viewportFraction: 1,
          autoPlay: true,
        ),
      ),
    );
  }
}
