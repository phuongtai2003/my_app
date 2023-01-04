import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
          ),
        ),
      ),
      height: 90,
      child: ListView.builder(
        itemExtent: 80,
        itemCount: GlobalVariables.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final categoryItem = GlobalVariables.categories[index];
          return Container(
            margin: const EdgeInsets.only(
              left: 10,
            ),
            height: 70,
            width: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Column(
              children: [
                Image.asset(
                  categoryItem['image']!,
                  width: 40,
                  height: 50,
                  fit: BoxFit.contain,
                ),
                Text(
                  categoryItem['title']!,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
