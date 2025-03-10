import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:app/models/Recipe.dart';

class FavouritesService extends ChangeNotifier {
  static final FavouritesService _instance = FavouritesService._internal();

  factory FavouritesService() => _instance;

  FavouritesService._internal() {
    _loadFavourites();
  }

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
    _saveFavourites();
    notifyListeners();
  }

  Future<void> _saveFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final favsJson = _favourites.map((recipe) => jsonEncode(recipe.toJson())).toList();
    await prefs.setStringList('favourites', favsJson);
  }

  Future<void> _loadFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final favsJson = prefs.getStringList('favourites');
    if (favsJson != null) {
      _favourites.clear();
      _favourites.addAll(favsJson.map((json) => Recipe.fromJson(jsonDecode(json))));
      notifyListeners();
    }
  }
}
