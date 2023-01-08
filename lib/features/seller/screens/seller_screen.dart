import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';

class SellerScreen extends StatefulWidget {
  const SellerScreen({super.key});
  static const String routeName = "/seller_screen";

  @override
  State<SellerScreen> createState() => _SellerScreenState();
}

class _SellerScreenState extends State<SellerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 5,
                  left: 5,
                ),
                child: Image.asset(
                  "assets/images/app_bar.png",
                  width: 50,
                  height: 50,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 15,
                  right: 5,
                ),
                child: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Add a product",
        backgroundColor: GlobalVariables.secondaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
