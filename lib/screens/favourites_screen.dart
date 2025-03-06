import 'package:flutter/material.dart';


class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});


  @override
  State<FavouritesScreen> createState() => _FavouritesScreen();

}

class _FavouritesScreen extends State<FavouritesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            floating: true,
            title: const Row(
            mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 20,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.black,
                    ),
                  ], // shadows
                ),
                SizedBox(width: 8),
                Text(
                  'Избранное',
                  style: TextStyle(
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.black,
                      ),
                    ], // shadows
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 20,
                  shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Colors.black,
                    ),
                  ], // shadows
                ),
              ], // children
            ),
          ),
        ], // slivers
      ),
    );
  }
}