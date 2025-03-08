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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Recipe && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
