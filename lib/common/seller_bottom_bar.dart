import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/features/profile/screens/profile_screen.dart';
import 'package:my_app/features/seller/screens/delete_product_screen.dart';
import 'package:my_app/features/seller/screens/seller_screen.dart';

class SellerBottomBar extends StatefulWidget {
  const SellerBottomBar({super.key});
  static const String routeName = '/seller_bar';

  @override
  State<SellerBottomBar> createState() => _SellerBottomBarState();
}

class _SellerBottomBarState extends State<SellerBottomBar> {
  int pageIndex = 0;
  double bottomBarItemWidth = 50;
  List<Widget> pages = [
    const SellerScreen(),
    const DeleteProductScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        unselectedItemColor: GlobalVariables.unselectedColor,
        selectedItemColor: GlobalVariables.selectedColor,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarItemWidth,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: pageIndex == 0
                        ? GlobalVariables.selectedColor
                        : GlobalVariables.unselectedColor,
                  ),
                ),
              ),
              child: const Icon(
                Icons.sell_outlined,
                size: 30,
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarItemWidth,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: pageIndex == 1
                        ? GlobalVariables.selectedColor
                        : GlobalVariables.unselectedColor,
                  ),
                ),
              ),
              child: const Icon(
                Icons.delete,
                size: 30,
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarItemWidth,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: pageIndex == 2
                        ? GlobalVariables.selectedColor
                        : GlobalVariables.unselectedColor,
                  ),
                ),
              ),
              child: const Icon(
                Icons.person_outline,
                size: 30,
              ),
            ),
            label: "",
          ),
        ],
        onTap: (value) {
          if (value != pageIndex) {
            setState(() {
              pageIndex = value;
            });
          }
        },
      ),
    );
  }
}
