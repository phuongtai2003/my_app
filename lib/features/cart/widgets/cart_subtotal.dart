import 'package:my_app/common/custom_button.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/features/checkout/screens/checkout_screen.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CartSubtotal extends StatefulWidget {
  const CartSubtotal({super.key});

  @override
  State<CartSubtotal> createState() => _CartSubtotalState();
}

class _CartSubtotalState extends State<CartSubtotal> {
  void proceedToCheckout() {
    Navigator.pushNamed(
      context,
      CheckoutScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    final userCart = context.watch<UserProvider>().user.cart;
    int sum = 0;
    userCart
        .map(
          (e) => sum = sum + (e['product']['price'] * e['quantity'] as int),
        )
        .toList();
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.5,
            color: GlobalVariables.secondaryColor,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "TOTAL",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "$sum \$",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: CustomButton(
              buttonText: "Checkout",
              onTap: proceedToCheckout,
            ),
          ),
        ],
      ),
    );
  }
}
