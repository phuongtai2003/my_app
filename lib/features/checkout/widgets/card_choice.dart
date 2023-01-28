import 'package:flutter/material.dart';
import 'package:my_app/common/custom_button.dart';
import 'package:my_app/common/custom_image_button.dart';
import 'package:my_app/features/checkout/widgets/credit_card.dart';
import 'package:my_app/features/checkout/widgets/under_appbar.dart';

class CardChoice extends StatelessWidget {
  const CardChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(31, 158, 158, 158),
      ),
      child: Column(
        children: [
          const UnderAppBar(),
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 20,
              ),
              child: Column(
                children: [
                  const CreditCard(),
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
                  CustomImageButton(
                    imageSource: "assets/images/paypal.png",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomImageButton(
                    imageSource: "assets/images/google_pay.png",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomImageButton(
                    imageSource: "assets/images/wallet.png",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          CustomButton(
            buttonText: "CONFIRM PAYMENT",
            onTap: () {},
          )
        ],
      ),
    );
  }
}
