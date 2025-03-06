class Recipe {
  final String name;
  final String imageLink;
  final String description;
  final List<String> ingredients;
  final List<String> instructions;

  Recipe({
    required this.name,
    required this.imageLink,
    required this.description,
    required this.ingredients,
    required this.instructions,
  });
}