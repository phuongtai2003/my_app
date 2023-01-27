import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.color = GlobalVariables.secondaryColor,
    this.height = 50,
  });
  final String buttonText;
  final VoidCallback onTap;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height),
        backgroundColor: color,
      ),
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }
}
