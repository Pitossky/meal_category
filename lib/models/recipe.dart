enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  cheap,
  pricey,
  luxurious,
}

class Recipe {
  final String recipeId;
  final List<String> recipeCategories;
  final String recipeTitle;
  final String imageUrl;
  final List<String> recipeIngredients;
  final List<String> cookingSteps;
  final int duration;
  final Complexity recipeComplexity;
  final Affordability recipeAffordability;
  final bool isVegan;
  final bool isLactoseFree;
  final bool isGlutenFree;
  final bool isVegetarian;

  const Recipe({
    required this.imageUrl,
    required this.cookingSteps,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.recipeAffordability,
    required this.recipeCategories,
    required this.recipeComplexity,
    required this.recipeId,
    required this.recipeIngredients,
    required this.recipeTitle,
  });
}
