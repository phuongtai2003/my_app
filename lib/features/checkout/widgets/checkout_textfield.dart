import 'package:flutter/material.dart';

class CheckoutTextField extends StatelessWidget {
  const CheckoutTextField(
      {super.key, required this.textEditingController, required this.hintText});
  final TextEditingController textEditingController;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 20,
      ),
      controller: textEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 20,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$hintText must not be empty";
        }
        return null;
      },
    );
  }
}
