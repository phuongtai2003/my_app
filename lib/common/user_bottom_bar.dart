import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/features/cart/screens/cart_screen.dart';
import 'package:my_app/features/home/screens/home_screen.dart';
import 'package:my_app/features/order/screens/order_screen.dart';
import 'package:my_app/features/profile/screens/profile_screen.dart';

class UserBottomBar extends StatefulWidget {
  const UserBottomBar({super.key});
  static const String routeName = '/bottom_bar';

  @override
  State<UserBottomBar> createState() => _UserBottomBarState();
}

class _UserBottomBarState extends State<UserBottomBar> {
  int pageIndex = 0;
  double bottomBarItemWidth = 50;

  List<Widget> pages = [
    const HomeScreen(),
    const ProfileScreen(),
    const CartScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          if (value != pageIndex) {
            setState(() {
              pageIndex = value;
            });
          }
        },
        currentIndex: pageIndex,
        selectedItemColor: GlobalVariables.selectedColor,
        unselectedItemColor: GlobalVariables.unselectedColor,
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
                Icons.house_outlined,
                size: 30,
              ),
            ),
            label: '',
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
                Icons.person_outline,
                size: 30,
              ),
            ),
            label: '',
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
                Icons.shopping_cart_outlined,
                size: 30,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
