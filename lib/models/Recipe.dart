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

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageLink': imageLink,
      'description': description,
      'ingredients': ingredients,
      'instructions': instructions,
    };
  }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      name: json['name'],
      imageLink: json['imageLink'],
      description: json['description'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: List<String>.from(json['instructions']),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Recipe && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
