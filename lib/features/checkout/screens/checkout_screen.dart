import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/features/checkout/widgets/address.dart';
import 'package:my_app/features/checkout/widgets/card_choice.dart';

enum Checkout {
  address,
  payment,
  confirm,
}

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});
  static const String routeName = '/checkout-screen';

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  Checkout _checkout = Checkout.address;

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
          title: const Text(
            "CHECKOUT",
            style: TextStyle(
              fontSize: 23,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: const CardChoice(),
    );
  }
}
