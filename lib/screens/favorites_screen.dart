import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../widgets/recipe_detail.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Recipe>? favorites;

  const FavoritesScreen({
    Key? key,
    this.favorites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return favorites != null && favorites!.isEmpty
        ? const Center(
            child: Text(
              'No Favorites yet, add some!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          )
        : ListView.builder(
      itemCount: favorites!.length,
      itemBuilder: (BuildContext context, int index){
        return RecipeDetail(
          id: favorites![index].recipeId,
          title: favorites![index].recipeTitle,
          imageUrl: favorites![index].imageUrl,
          duration: favorites![index].duration,
          affordability: favorites![index].recipeAffordability,
          complexity: favorites![index].recipeComplexity,
        );
      },
    );
  }
}
