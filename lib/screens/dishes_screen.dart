import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/widgets/dish_button.dart';
import 'package:app/widgets/dish_recipe.dart';
import 'package:app/models/Recipe.dart';

class Dishes extends StatelessWidget {
  const Dishes({super.key, required this.title, required this.svgPath, required this.dishes});

  final String title;
  final String svgPath;
  final List<Recipe> dishes;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.green,
              centerTitle: true,
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                      svgPath,
                      height: 25,
                      width: 20
                  ),
                  SizedBox(width: 8),
                  Text(
                      title,
                    style: const TextStyle(
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Colors.black,
                        ),
                      ],
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  SvgPicture.asset(
                      svgPath,
                      height: 25,
                      width: 20
                  ),
                ],
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: dishes.map((dish) => DishButton(
              title: dish.name,
              imagePath: dish.imageLink,
              svgPath: svgPath,
              onPressed: () => showDishRecipe(context, dish),
            )).toList(),
          ),
        ),
      ),
    );
  }
}
