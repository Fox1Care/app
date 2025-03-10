import 'package:flutter/material.dart';
import 'package:app/screens/dishes_screen.dart';
import 'package:app/services/recipe_service.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.title,
    required this.imagePath,
    required this.svgPath,
  });

  final String title;
  final String imagePath;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double buttonHeight = screenWidth * 0.3;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(screenWidth * 0.9, buttonHeight),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      onPressed:() async {
        final categoryRecipes = await loadRecipes(svgPath);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Dishes(
              title: title,
              svgPath: svgPath,
              dishes: categoryRecipes,
            ),
          ),
        );
      },
      child: Ink.image(
        image: AssetImage(imagePath),
        fit: BoxFit.cover,
        width: screenWidth,
        height: buttonHeight,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              shadows: [
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Colors.black,
                ),
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