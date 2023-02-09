import 'package:flutter/material.dart';
import 'package:my_app/common/custom_button.dart';
import 'package:my_app/constants/utils.dart';
import 'package:my_app/features/checkout/widgets/checkout_textfield.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class Address extends StatefulWidget {
  const Address({
    super.key,
    required this.callback,
  });
  final Function(String) callback;
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

  String addressToBeUsed = "";

  void setAddress(String address) {
    bool formIsFilled = _houseNumberController.text.isNotEmpty ||
        _streetController.text.isNotEmpty ||
        _wardController.text.isNotEmpty ||
        _districtController.text.isNotEmpty ||
        _cityController.text.isNotEmpty;
    if (formIsFilled) {
      if (_addressFormKey.currentState!.validate()) {
        addressToBeUsed =
            "No ${_houseNumberController.text} - St.${_streetController.text} - Ward ${_wardController.text} - District ${_districtController.text} - ${_cityController.text}";
      } else {
        throw Exception(
          "Please fill all of the fields",
        );
      }
    } else if (address.isNotEmpty) {
      addressToBeUsed = address;
    } else {
      showSnackBar(
        context,
        "Error while reading address",
      );
    }
  }

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
    final String address = context.watch<UserProvider>().user.address;
    return Container(
      padding: const EdgeInsets.all(
        8,
      ),
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
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
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
                    height: 10,
                  ),
                  CheckoutTextField(
                    textEditingController: _streetController,
                    hintText: "Street",
                  ),
                  const SizedBox(
                    height: 10,
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
                        width: 5,
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
                    height: 10,
                  ),
                  CheckoutTextField(
                    textEditingController: _cityController,
                    hintText: "City",
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          CustomButton(
            buttonText: "NEXT - PAYMENT INFO",
            onTap: () {
              setAddress(address);
              widget.callback(addressToBeUsed);
            },
            height: 110,
          ),
        ],
      ),
    );
  }
}
