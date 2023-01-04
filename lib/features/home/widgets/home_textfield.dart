import 'package:flutter/material.dart';

class HomeTextField extends StatelessWidget {
  const HomeTextField({
    super.key,
    required this.controller,
    required this.onPressed,
    required this.hintText,
  });
  final TextEditingController controller;
  final VoidCallback onPressed;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (value) => onPressed,
      decoration: InputDecoration(
        prefixIcon: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.search,
            color: Colors.black,
            size: 30,
          ),
        ),
        contentPadding: const EdgeInsets.only(
          top: 25,
          left: 5,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
      ),
      maxLines: 2,
    );
  }
}
