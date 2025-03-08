import 'package:flutter/material.dart';
import 'package:app/models/Recipe.dart';

class FavouritesService extends ChangeNotifier {
  static final FavouritesService _instance = FavouritesService._internal();

  factory FavouritesService() => _instance;

  FavouritesService._internal();

  final List<Recipe> _favourites = [];

  List<Recipe> get favourites => List.unmodifiable(_favourites);

  bool isFavourite(Recipe recipe) {
    return _favourites.contains(recipe);
  }

  void toggleFavourite(Recipe recipe) {
    if (isFavourite(recipe)) {
      _favourites.remove(recipe);
    } else {
      _favourites.add(recipe);
    }
    notifyListeners();
  }
}
