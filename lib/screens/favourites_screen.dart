import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/services/favourites_service.dart';
import 'package:app/models/Recipe.dart';
import 'package:app/widgets/dish_button.dart';
import 'package:app/widgets/dish_recipe.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favouritesService = context.watch<FavouritesService>();
    final List<Recipe> favourites = favouritesService.favourites;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            floating: true,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'lib/assets/icons/star.svg',
                  height: 25,
                  width: 20,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Избранное',
                  style: TextStyle(
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
                const SizedBox(width: 8),
                SvgPicture.asset(
                  'lib/assets/icons/star.svg',
                  height: 25,
                  width: 20,
                ),
              ],
            ),
          ),
          favourites.isEmpty
              ? const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  textAlign: TextAlign.center,
                  "Для просмотра избранных блюд необходимо их добавить!",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                      FontWeight.bold
                  ),
                ),
              ),
            ),
          )
              : SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final dish = favourites[index];
                return DishButton(
                  title: dish.name,
                  imagePath: dish.imageLink,
                  svgPath: 'lib/assets/icons/star.svg',
                  onPressed: () {
                    showDishRecipe(context, favourites[index]);
                    },
                  recipe: dish,
                );
              },
              childCount: favourites.length,
            ),
          ),
        ],
      ),
    );
  }
}
