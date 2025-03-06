String getCategoryFromSvg(String svgPath) {
  String fileName = svgPath.split('/').last;

  Map<String, String> categoryMap = {
    'soup.svg': 'Soups',
    'salad.svg' : 'Salads',
    'dessert.svg': 'Desserts',
    'meat.svg' : 'Meats',
  };

  if (categoryMap.containsKey(fileName)) {
    return categoryMap[fileName]!;
  } else {
    throw Exception('Category not found for SVG path: $svgPath');
  }
}
