String getCategoryFromSvg(String svgPath) {
  String fileName = svgPath.split('/').last;


  Map<String, String> categoryMap = {
    'soup.svg': 'soups',
    'salad.svg' : 'salads',
    'dessert.svg': 'desserts',
    'meat.svg' : 'meats',
    'potato.svg' : 'potato',
    'bakery.svg' : 'bakery',
    'drinks.svg' : 'drinks'
  };

  if (categoryMap.containsKey(fileName)) {
    return categoryMap[fileName]!;
  } else {
    throw Exception('Category not found for SVG path: $svgPath');
  }
}
