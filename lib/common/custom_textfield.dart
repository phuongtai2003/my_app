import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.maxLines = 1,
  });
  final TextEditingController textEditingController;
  final String hintText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
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
        hintText: hintText,
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
