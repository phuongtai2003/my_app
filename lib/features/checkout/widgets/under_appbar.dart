import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:badges/badges.dart';

class UnderAppBar extends StatelessWidget {
  const UnderAppBar({super.key, required this.state});
  final int state;

  @override
  Widget build(BuildContext context) {
    Color shippingColor = GlobalVariables.secondaryColor;
    Color paymentColor = GlobalVariables.secondaryColor;
    Color confirmColor = GlobalVariables.secondaryColor;
    if (state == 1) {
      shippingColor = GlobalVariables.unselectedColor;
      paymentColor = GlobalVariables.unselectedColor;
      confirmColor = GlobalVariables.unselectedColor;
    } else if (state == 2) {
      paymentColor = GlobalVariables.unselectedColor;
      confirmColor = GlobalVariables.unselectedColor;
    } else {
      confirmColor = GlobalVariables.unselectedColor;
    }
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
                children: [
                  state > 1
                      ? Badge(
                          badgeContent: const Icon(
                            Icons.check,
                            size: 12,
                          ),
                          badgeStyle: const BadgeStyle(
                            badgeColor: GlobalVariables.secondaryColor,
                          ),
                          child: Icon(
                            Icons.location_on_outlined,
                            size: 35,
                            color: shippingColor,
                          ),
                        )
                      : Icon(
                          Icons.location_on_outlined,
                          size: 35,
                          color: shippingColor,
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "SHIPPING",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: shippingColor,
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
                children: [
                  state > 2
                      ? Badge(
                          badgeContent: const Icon(
                            Icons.check,
                            size: 12,
                          ),
                          badgeStyle: const BadgeStyle(
                            badgeColor: GlobalVariables.secondaryColor,
                          ),
                          child: Icon(
                            Icons.credit_card_outlined,
                            size: 35,
                            color: paymentColor,
                          ),
                        )
                      : Icon(
                          Icons.credit_card_outlined,
                          size: 35,
                          color: paymentColor,
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "PAYMENT",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: paymentColor,
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
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 35,
                    color: confirmColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "CONFIRM",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: confirmColor,
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
