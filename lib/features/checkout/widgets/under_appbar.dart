import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';

class UnderAppBar extends StatelessWidget {
  const UnderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 0.5,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Column(
                children: const [
                  Icon(
                    Icons.location_on_outlined,
                    size: 35,
                    color: GlobalVariables.secondaryColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "SHIPPING",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                      color: GlobalVariables.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Column(
                children: const [
                  Icon(
                    Icons.credit_card_outlined,
                    size: 35,
                    color: GlobalVariables.secondaryColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "PAYMENT",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                      color: GlobalVariables.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Column(
                children: const [
                  Icon(
                    Icons.check_circle_outline,
                    size: 35,
                    color: GlobalVariables.secondaryColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "CONFIRM",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                      color: GlobalVariables.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
