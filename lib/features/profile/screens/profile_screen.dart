import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/features/profile/widgets/profile_buttons.dart';
import 'package:my_app/features/profile/widgets/name.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = "/profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          50,
        ),
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
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                ),
                child: Image.asset(
                  "assets/images/app_bar.png",
                  width: 50,
                  height: 50,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  right: 10,
                ),
                child: const Icon(
                  Icons.search_rounded,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: const [
          Name(),
          SizedBox(
            height: 15,
          ),
          AccountButtons(),
        ],
      ),
    );
  }
}
