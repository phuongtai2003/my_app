import 'package:flutter/material.dart';
import 'package:my_app/common/custom_button.dart';
import 'package:my_app/features/checkout/widgets/credit_card.dart';

enum PaymentMethod {
  visa,
  paypal,
  googlePay,
  wallet,
}

class CardChoice extends StatefulWidget {
  const CardChoice({
    super.key,
    required this.callback,
  });
  final Function(String) callback;

  @override
  State<CardChoice> createState() => _CardChoiceState();
}

class _CardChoiceState extends State<CardChoice> {
  PaymentMethod _method = PaymentMethod.visa;
  String methodToBeUsed = "";
  void setMethod() {
    if (_method == PaymentMethod.visa) {
      methodToBeUsed = "Visa";
    } else if (_method == PaymentMethod.paypal) {
      methodToBeUsed = "Paypal";
    } else if (_method == PaymentMethod.googlePay) {
      methodToBeUsed = "Google Pay";
    } else {
      methodToBeUsed = "COD";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: const Text(
              "PAYING WITH",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 20,
            ),
            child: Column(
              children: [
                GestureDetector(
                  child: const CreditCard(),
                  onTap: () {
                    setState(() {
                      _method = PaymentMethod.visa;
                    });
                  },
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: const Text(
                    "OR",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: ListTile(
                      title: Image.asset(
                        "assets/images/paypal.png",
                        width: 75,
                        height: 50,
                      ),
                      leading: Radio(
                        value: PaymentMethod.paypal,
                        groupValue: _method,
                        onChanged: (value) {
                          setState(
                            () {
                              _method = value!;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: ListTile(
                      title: Image.asset(
                        "assets/images/google_pay.png",
                        width: 75,
                        height: 50,
                      ),
                      leading: Radio(
                        value: PaymentMethod.googlePay,
                        groupValue: _method,
                        onChanged: (value) {
                          setState(
                            () {
                              _method = value!;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: ListTile(
                      title: Image.asset(
                        "assets/images/wallet.png",
                        width: 75,
                        height: 50,
                      ),
                      leading: Radio(
                        value: PaymentMethod.wallet,
                        groupValue: _method,
                        onChanged: (value) {
                          setState(
                            () {
                              _method = value!;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            buttonText: "CONFIRM PAYMENT",
            onTap: () {
              setMethod();
              widget.callback(methodToBeUsed);
            },
          )
        ],
      ),
    );
  }
}
