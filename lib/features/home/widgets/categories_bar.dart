import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/features/home/screens/category_screen.dart';

class CategoriesBar extends StatefulWidget {
  const CategoriesBar({super.key});

  @override
  State<CategoriesBar> createState() => _CategoriesBarState();
}

class _CategoriesBarState extends State<CategoriesBar> {
  void navigateToCategoryScreen(String category) {
    Navigator.pushNamed(
      context,
      CategoryScreen.routeName,
      arguments: category,
    );
  }

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
          return GestureDetector(
            onTap: () => navigateToCategoryScreen(categoryItem['title']!),
            child: Container(
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
            ),
          );
        },
      ),
    );
  }
}
