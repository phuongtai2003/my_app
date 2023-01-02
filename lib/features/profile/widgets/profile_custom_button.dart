import 'package:flutter/material.dart';

class ProfileCustomButton extends StatelessWidget {
  const ProfileCustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.color = Colors.grey,
  });
  final VoidCallback onPressed;
  final Color color;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size.fromHeight(
          50,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
      ),
    );
  }
}
