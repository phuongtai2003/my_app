import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
    required this.name,
  });
  static const String routeName = '/search-screen';
  final String name;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 5,
                  top: 5,
                ),
                child: Image.asset(
                  "assets/images/app_bar.png",
                  width: 50,
                  height: 50,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                child: const Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
