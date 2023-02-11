import 'package:flutter/material.dart';
import 'package:my_app/common/custom_button.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/features/cart/widgets/cart_product.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class Confirmation extends StatelessWidget {
  const Confirmation({
    super.key,
    required this.payment,
    required this.callback,
    required this.totalPrice,
  });
  final String payment;
  final VoidCallback callback;
  final int totalPrice;
  @override
  Widget build(BuildContext context) {
    final address = context.watch<UserProvider>().user.address;
    final userCart = context.watch<UserProvider>().user.cart;
    int totalQuantity = 0;
    userCart.map(
      (x) {
        totalQuantity = totalQuantity + x['quantity'] as int;
      },
    ).toList();
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Order Information",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Number of products: ${userCart.length}",
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Total amount of products: $totalQuantity",
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Total Billing: \$$totalPrice",
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Deliverance address: $address",
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Payment method: $payment",
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Items includes:",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: GlobalVariables.secondaryColor,
              ),
              borderRadius: BorderRadius.circular(
                15,
              ),
            ),
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return CartProduct(
                  index: index,
                  changable: false,
                );
              },
              itemCount: userCart.length,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            buttonText: "Confirm",
            onTap: callback,
          ),
        ],
      ),
    );
  }
}
