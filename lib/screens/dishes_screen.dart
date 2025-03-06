import 'package:flutter/material.dart';
import 'package:app/widgets/dish_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/models/Recipe.dart';

class Dishes extends StatefulWidget {
  const Dishes({super.key, required this.title, required this.svgPath, required this.dishes});
  final String title;
  final String svgPath;
  final List<Recipe> dishes;

  @override
  _Dishes createState() => _Dishes();
}

class _Dishes extends State<Dishes> with WidgetsBindingObserver{

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(widget.svgPath,
                    height: 25,
                    width: 20
                ),
                const SizedBox(width: 8),
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
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
                const SizedBox(width: 8),
                SvgPicture.asset(widget.svgPath,
                    height: 25,
                    width: 20
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final dish = widget.dishes[index];
                // Создание блюд;
                return DishButton(
                  title: dish.name,
                  imagePath: dish.imageLink,
                  svgPath: widget.svgPath,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) {
                        return DraggableScrollableSheet(
                          expand: false,
                          initialChildSize: 0.8,
                          maxChildSize: 0.9,
                          builder: (context, scrollController) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    offset: Offset(0, -3),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(16),
                              child: SingleChildScrollView(
                                controller: scrollController,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(12),
                                          child: Image.asset(
                                            dish.imageLink,
                                            height: 120,
                                            width: 120,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(width: 16),
                                        Expanded(
                                          child: Text(
                                            dish.name,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Divider(color: Colors.black, thickness: 2),

                                    Text(
                                      dish.description,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black
                                      ),
                                    ),

                                    Divider(color: Colors.black, thickness: 2),

                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 8),
                                      child: Text(
                                        "Ингредиенты",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: dish.ingredients.map((ingredient) => Padding(
                                        padding: EdgeInsets.symmetric(vertical: 4),
                                        child: Text(
                                          "• $ingredient",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black
                                          ),
                                        ),
                                      )).toList(),
                                    ),

                                    Divider(color: Colors.black, thickness: 2),

                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 8),
                                      child: Text(
                                        "Инструкция по приготовлению",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: dish.instructions.map((instruction) => Padding(
                                        padding: EdgeInsets.symmetric(vertical: 4),
                                        child: Text(
                                          "• $instruction",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black
                                          ),
                                        ),
                                      )).toList(),
                                    ),
                                  ], // children
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
              childCount: widget.dishes.length,
            ),
          ),
        ], // slivers
      ),
    );
  }
}
