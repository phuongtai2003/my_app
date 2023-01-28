import 'package:flutter/material.dart';

class CustomImageButton extends StatelessWidget {
  const CustomImageButton({
    super.key,
    required this.imageSource,
    required this.onTap,
    this.color = Colors.white,
  });
  final String imageSource;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size.fromHeight(50),
        elevation: 3,
      ),
      onPressed: onTap,
      child: Image.asset(
        imageSource,
        width: 100,
        height: 50,
      ),
    );
  }
}
