import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:app/models/Recipe.dart';
import 'package:app/utils/category_mapper.dart';


Future<List<Recipe>> loadRecipes(String svgPath) async {
  try {
    final String recipesJson = await rootBundle.loadString('lib/assets/data/recipes.json');
    final Map<String, dynamic> recipesData = json.decode(recipesJson);

    String categoryFilePath = '';

    String categoryName = getCategoryFromSvg(svgPath);

    for (var category in recipesData['categories']) {
      if (category['name'] == categoryName) {
        categoryFilePath = category['file'];
        break;
      }
    }

    if (categoryFilePath.isEmpty) {
      throw Exception('Category not found for SVG path: $svgPath');
    }

    final String categoryJson = await rootBundle.loadString(categoryFilePath);
    final List<dynamic> categoryData = json.decode(categoryJson);

    List<Recipe> recipeList = categoryData.map((recipe) {
      return Recipe(
        name: recipe['name'],
        imageLink: recipe['imageLink'],
        description: recipe['description'],
        ingredients: List<String>.from(recipe['ingredients']),
        instructions: List<String>.from(recipe['instructions']),
      );
    }).toList();
    return recipeList;
  } catch (e) {
    print('Error loading recipes: $e');
    return [];
  }


}