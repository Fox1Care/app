import 'package:flutter/material.dart';

class DishButton extends StatelessWidget {
  const DishButton({
    super.key,
    required this.title,
    required this.imagePath,
    required this.svgPath,
    required this.onPressed,
  });

  final String title;
  final String imagePath;
  final String svgPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(400, 120),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      onPressed: onPressed,
      child: Ink.image(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
        width: 400,
        height: 120,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              shadows: [
                Shadow(offset: Offset(2.0, 2.0), blurRadius: 3.0, color: Colors.black),
              ],
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
