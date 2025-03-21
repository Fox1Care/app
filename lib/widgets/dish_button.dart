import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/services/favourites_service.dart';
import 'package:app/models/Recipe.dart';

class DishButton extends StatelessWidget {
  const DishButton({
    super.key,
    required this.title,
    required this.imagePath,
    required this.svgPath,
    required this.recipe,
    required this.onPressed,
  });

  final String title;
  final String imagePath;
  final String svgPath;
  final Recipe recipe;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double buttonHeight = screenWidth * 0.3;

    return Consumer<FavouritesService>(
      builder: (context, favouritesService, child) {
        bool isFav = favouritesService.isFavourite(recipe);

        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(screenWidth * 0.9, buttonHeight),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          onPressed: onPressed,
          child: Stack(
            children: [
              Ink.image(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                width: screenWidth,
                height: buttonHeight,
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      shadows: [
                        Shadow(offset:
                        Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Colors.black
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
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  icon: Icon(
                    isFav ? Icons.star : Icons.star_border,
                    color: isFav ? Colors.yellow : Colors.white,
                    size: 28,
                  ),
                  onPressed: () {
                    favouritesService.toggleFavourite(recipe);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
