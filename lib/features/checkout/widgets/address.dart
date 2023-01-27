import 'package:flutter/material.dart';
import 'package:my_app/common/custom_button.dart';
import 'package:my_app/features/checkout/widgets/checkout_textfield.dart';

class Address extends StatefulWidget {
  const Address({
    super.key,
    required this.callback,
  });
  final VoidCallback callback;
  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  final GlobalKey<FormState> _addressFormKey = GlobalKey<FormState>();
  final TextEditingController _houseNumberController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _wardController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  
  @override
  void dispose() {
    super.dispose();
    _houseNumberController.dispose();
    _streetController.dispose();
    _wardController.dispose();
    _districtController.dispose();
    _cityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black12,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              child: const Text(
                "SHIPPING ADRESS",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Form(
                key: _addressFormKey,
                child: Column(
                  children: [
                    CheckoutTextField(
                      textEditingController: _houseNumberController,
                      hintText: "House Number",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CheckoutTextField(
                      textEditingController: _streetController,
                      hintText: "Street",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CheckoutTextField(
                            textEditingController: _wardController,
                            hintText: "Ward",
                          ),
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        Expanded(
                          child: CheckoutTextField(
                            textEditingController: _districtController,
                            hintText: "District",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CheckoutTextField(
                      textEditingController: _cityController,
                      hintText: "City",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      buttonText: "NEXT - PAYMENT INFO",
                      onTap: widget.callback,
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
