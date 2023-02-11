import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/features/checkout/services/checkout_services.dart';
import 'package:my_app/features/checkout/widgets/address.dart';
import 'package:my_app/features/checkout/widgets/payment.dart';
import 'package:my_app/features/checkout/widgets/confirmation.dart';
import 'package:my_app/features/checkout/widgets/under_appbar.dart';

enum Checkout {
  address,
  payment,
  confirm,
}

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    super.key,
    required this.totalPrice,
  });
  static const String routeName = '/checkout-screen';
  final int totalPrice;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  Checkout _checkout = Checkout.address;
  String addressToBeUsed = "";
  String paymentMethod = "";
  int state = 1;
  final CheckoutServices _checkoutServices = CheckoutServices();

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            UnderAppBar(
              state: state,
            ),
            if (_checkout == Checkout.address)
              Address(
                callback: (value) {
                  addressToBeUsed = value;
                  if (addressToBeUsed.isNotEmpty) {
                    setState(() {
                      _checkout = Checkout.payment;
                      state++;
                    });
                    _checkoutServices.setUserAddress(
                      context: context,
                      address: addressToBeUsed,
                    );
                  }
                },
              ),
            if (_checkout == Checkout.payment)
              CardChoice(
                callback: (value) {
                  paymentMethod = value;
                  if (paymentMethod.isNotEmpty) {
                    setState(
                      () {
                        _checkout = Checkout.confirm;
                        state++;
                      },
                    );
                  }
                },
              ),
            if (_checkout == Checkout.confirm)
              Confirmation(
                payment: paymentMethod,
                totalPrice: widget.totalPrice,
                callback: () {
                  _checkoutServices.createOrder(
                    context: context,
                    totalPrice: widget.totalPrice,
                    paymentMethod: paymentMethod,
                  );
                  
                },
              ),
          ],
        ),
      ),
    );
  }
}
