import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/features/home/screens/home_screen.dart';

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
    const Text("Profile"),
    const Text("Cart"),
    const Text("Order")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
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
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarItemWidth,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: pageIndex == 3
                        ? GlobalVariables.selectedColor
                        : GlobalVariables.unselectedColor,
                  ),
                ),
              ),
              child: const Icon(
                Icons.payment_outlined,
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
