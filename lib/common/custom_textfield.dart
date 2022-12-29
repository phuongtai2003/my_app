import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.textEditingController, required this.hintText});
  final TextEditingController textEditingController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        hintText: "Enter your $hintText",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter your $hintText";
        }
        return null;
      },
    );
  }
}
